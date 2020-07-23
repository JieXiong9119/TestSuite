import argparse
from collections import namedtuple
import os
import sys

from lxml import etree, isoschematron

from .constants import SVRL_NSMAP, SCH_NSMAP

Failure = namedtuple('Failure', ['line', 'element', 'message', 'role'])

def _get_unfired_rules(schematron, phase):
    # get expected rules
    schematron_tree = schematron.schematron
    if schematron_tree is None:
        raise Exception('Schematron is missing schematron attribute. Was schematron created with `store_schematron=True`?')
    with open('asdfg.sch', 'w') as f:
        f.write(etree.tostring(schematron_tree, pretty_print=True).decode())

    if phase is None:
        # get all rules in the schematron
        rules = schematron_tree.xpath(
            '//sch:rule',
            namespaces=SCH_NSMAP,
        )
    else:
        # only get the rules that pare part of the specified pattern's active phases
        pattern_ids = schematron_tree.xpath(
            f'//sch:phase[@id = "{phase}"]/sch:active/@pattern',
            namespaces=SCH_NSMAP,
        )

        rules = []
        for pattern_id in pattern_ids:
            rules += schematron_tree.xpath(
                f'//sch:pattern[@id = "{pattern_id}"]/sch:rule',
                namespaces=SCH_NSMAP,
            )

    expected_rules = [rule.get('context') for rule in rules]

    # get fired rules
    result_tree = schematron.validation_report
    if result_tree is None:
        raise Exception('Schematron is missing schematron attribute. Was schematron created with `store_schematron=True`?')

    rules = result_tree.xpath(
        '//svrl:fired-rule',
        namespaces=SVRL_NSMAP,
    )
    fired_rules = [rule.get('context') for rule in rules]

    # find the difference in rule counts between fired and unfired
    rule_counts = {}
    for rule in expected_rules:
        if rule in rule_counts:
            rule_counts[rule] += 1
        else:
            rule_counts[rule] = 1
    
    for rule in fired_rules:
        rule_counts[rule] -= 1

    # find unfired rules then sort them back into order
    unfired_rules = [rule for rule, count in rule_counts.items() if count > 0]
    unfired_rules = [rule for rule in expected_rules if rule in unfired_rules]

    return unfired_rules

def validate_schematron(schematron, document, result_path=None, phase=None, strict_context=True):
    """
    Runs schematron on the given document and returns an array of failures

    :param schematron: str, path to sch file or string containing schematron xml
    :param document: str, path to xml file to test or string containing document xml
    :param result_path: str, path to file to save the svrl result
    :returns: Failure[], list of failures
    """
    try:
        schematron_tree = etree.fromstring(schematron)
    except etree.XMLSyntaxError:
        schematron_tree = etree.parse(schematron)
        
    schematron = isoschematron.Schematron(
        schematron_tree,
        phase=phase,
        store_report=True,
        store_schematron=True,
    )

    try:
        document_tree = etree.fromstring(document)
    except etree.XMLSyntaxError:
        document_tree = etree.parse(document)

    schematron.validate(document_tree)
    
    strout = etree.tostring(schematron.validation_report, pretty_print=True)
    if result_path is not None:
        with open(result_path, 'wb') as f:
            f.write(strout)

    failures = []
    if strict_context:
        unfired_rules = _get_unfired_rules(schematron, phase)

        for rule in unfired_rules:
            failures.append(Failure(
                line=0,
                element=None,
                message=f'Rule was NOT used for validation: {rule}',
                role='ERROR'
            ))

    failed_asserts = schematron.validation_report.xpath(
        '/svrl:schematron-output/svrl:failed-assert',
        namespaces=SVRL_NSMAP)

    for failed_assert in failed_asserts:
        # location stores an xpath to the element which failed validation
        location = failed_assert.get('location')
        failed_element = document_tree.xpath(location)[0]
        tag = failed_element.tag.replace("{http://buildingsync.net/schemas/bedes-auc/2019}", "auc:")
        error_message = failed_assert[0].text
        failures.append(Failure(
            line=failed_element.sourceline,
            element=tag,
            message=error_message,
            role=failed_assert.get('role', 'ERROR')
        ))
    return failures


def print_failure(filename, failure, colored=False):
    """
    Pretty prints a failure

    :param filename: str, path to file tested
    :param failure: Failure
    :param colored: bool, prints with ansi colors according to failure severity
    """
    def color_string(message, severity):
        RED = '31m'
        YELLOW = '33m'
        BLUE = '34m'
        WHITE = '37m'
        RESET = '0m'
        color_map = {
            'ERROR': RED,
            'WARNING': YELLOW,
            'INFO': BLUE,
        }
        return f'\033[{color_map.get(severity, WHITE)}{message}\033[{RESET}'
    message = f'[{failure.role}] {filename}:{failure.line}: {failure.element}: {failure.message}'
    if colored:
        message = color_string(message, failure.role)
    print(message)
