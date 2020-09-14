<?xml version='1.0' encoding='ASCII'?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <sch:phase id="facility_description" see="ASHRAE 211 6.1.1 and 6.2.1.1">
    <sch:active pattern="document_structure_prerequisites_misc_building_info"/>
    <sch:active pattern="misc_building_info"/>
    <sch:active pattern="document_structure_prerequisites_contact_information"/>
    <sch:active pattern="contact_information"/>
    <sch:active pattern="document_structure_prerequisites_space_functions"/>
    <sch:active pattern="space_functions"/>
  </sch:phase>
  <sch:phase id="schedules" see="ASHRAE 211 6.2.1.1 (e)">
    <sch:active pattern="document_structure_prerequisites_general_schedule_requirements"/>
    <sch:active pattern="general_schedule_requirements"/>
    <sch:active pattern="document_structure_prerequisites_occupancy_schedules"/>
    <sch:active pattern="occupancy_schedules"/>
  </sch:phase>
  <sch:phase id="multigeneration_and_onsite_renewable_energy_systems" see="ASHRAE 211 6.2.1.1 (f)">
    <sch:active pattern="generation_systems"/>
  </sch:phase>
  <sch:pattern see="" id="document_structure_prerequisites_misc_building_info">
    <sch:title>Document Structure Prerequisites Misc Building Info</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.1.1.1, 6.1.1.2, and 6.2.1.1" id="misc_building_info">
    <sch:title>Misc Building Info</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building">
      <sch:let name="buildingDoesNotHaveResidents" value="auc:BuildingClassification/text() != 'Mixed use commercial' and auc:BuildingClassification/text() != 'Residential'"/>
      <sch:assert test="auc:PremisesName" role="">auc:PremisesName</sch:assert>
      <sch:assert test="auc:Address/auc:City" role="">auc:Address/auc:City</sch:assert>
      <sch:assert test="auc:Address/auc:State" role="">auc:Address/auc:State</sch:assert>
      <sch:assert test="auc:Address/auc:PostalCode" role="">auc:Address/auc:PostalCode</sch:assert>
      <sch:assert test="auc:Address/auc:StreetAddressDetail/auc:Simplified/auc:StreetAddress" role="">auc:Address/auc:StreetAddressDetail/auc:Simplified/auc:StreetAddress</sch:assert>
      <sch:assert test="auc:FloorsAboveGrade" role="">auc:FloorsAboveGrade</sch:assert>
      <sch:assert test="auc:FloorsBelowGrade" role="">auc:FloorsBelowGrade</sch:assert>
      <sch:assert test="auc:ConditionedFloorsAboveGrade" role="">auc:ConditionedFloorsAboveGrade</sch:assert>
      <sch:assert test="auc:ConditionedFloorsBelowGrade" role="">auc:ConditionedFloorsBelowGrade</sch:assert>
      <sch:assert test="auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Gross']/auc:FloorAreaValue" role="">auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Gross']/auc:FloorAreaValue</sch:assert>
      <sch:assert test="auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Conditioned']/auc:FloorAreaValue" role="">auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Conditioned']/auc:FloorAreaValue</sch:assert>
      <sch:assert test="auc:BuildingClassification" role="">auc:BuildingClassification</sch:assert>
      <sch:assert test="auc:OccupancyClassification" role="">auc:OccupancyClassification</sch:assert>
      <sch:assert test="auc:YearOfConstruction" role="">auc:YearOfConstruction</sch:assert>
      <sch:assert test="auc:YearOfLastMajorRemodel" role="WARNING">auc:YearOfLastMajorRemodel</sch:assert>
      <sch:assert test="auc:YearOfLastEnergyAudit" role="WARNING">auc:YearOfLastEnergyAudit</sch:assert>
      <sch:assert test="auc:RetrocommissioningDate" role="WARNING">auc:RetrocommissioningDate</sch:assert>
      <sch:assert test="$buildingDoesNotHaveResidents or auc:SpatialUnits/auc:SpatialUnit[auc:SpatialUnitType/text() = 'Apartment units']/auc:NumberOfUnits" role="">If BuildingClassification implies residents (Mixed use commercial or Residential), number of apartments units must be defined at auc:SpatialUnits/auc:SpatialUnit[auc:SpatialUnitType = 'Apartment units']/auc:NumberOfUnits.</sch:assert>
      <sch:assert test="$buildingDoesNotHaveResidents or auc:SpatialUnits/auc:SpatialUnit[auc:SpatialUnitType/text() = 'Apartment units']/auc:SpatialUnitOccupiedPercentage" role="">If BuildingClassification implies residents (Mixed use commercial or Residential), the percentage occupied must be defined at auc:SpatialUnits/auc:SpatialUnit[auc:SpatialUnitType = 'Apartment units']/auc:SpatialUnitOccupiedPercentage.</sch:assert>
      <sch:assert test="auc:PremisesNotes" role="">Premises Notes should exist and it should include requirements specified by ASHRAE 211 sections 6.1.1.1.m, 6.1.1.2.a, 6.1.1.2.c, 6.1.1.2.d and 6.1.1.2.e
</sch:assert>
      <sch:assert test="auc:HistoricalLandmark" role="">auc:HistoricalLandmark</sch:assert>
      <sch:assert test="auc:PrimaryContactID[@IDref = //auc:Contacts/auc:Contact/@ID]" role="">auc:PrimaryContactID should be linked to an auc:Contact's ID</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report">
      <sch:assert test="auc:AuditorContactID[@IDref = //auc:Contacts/auc:Contact/@ID]" role="">auc:AuditorContactID should be linked to an auc:Contact's ID</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_contact_information">
    <sch:title>Document Structure Prerequisites Contact Information</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Owner']" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Owner']</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Energy Auditor']" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Energy Auditor']</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.1.1.1.b and 6.1.1.1.c" id="contact_information">
    <sch:title>Contact Information</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Owner']">
      <sch:assert test="auc:ContactName" role="">auc:ContactName</sch:assert>
      <sch:assert test="auc:ContactTelephoneNumbers/auc:ContactTelephoneNumber/auc:TelephoneNumber" role="WARNING">auc:ContactTelephoneNumbers/auc:ContactTelephoneNumber/auc:TelephoneNumber</sch:assert>
      <sch:assert test="auc:ContactEmailAddresses/auc:ContactEmailAddress/auc:EmailAddress" role="WARNING">auc:ContactEmailAddresses/auc:ContactEmailAddress/auc:EmailAddress</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact[auc:ContactRoles/auc:ContactRole/text() = 'Energy Auditor']">
      <sch:assert test="auc:ContactName" role="">auc:ContactName</sch:assert>
      <sch:assert test="auc:ContactTelephoneNumbers/auc:ContactTelephoneNumber/auc:TelephoneNumber" role="WARNING">auc:ContactTelephoneNumbers/auc:ContactTelephoneNumber/auc:TelephoneNumber</sch:assert>
      <sch:assert test="auc:ContactEmailAddresses/auc:ContactEmailAddress/auc:EmailAddress" role="WARNING">auc:ContactEmailAddresses/auc:ContactEmailAddress/auc:EmailAddress</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_space_functions">
    <sch:title>Document Structure Prerequisites Space Functions</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.1.1.1.g/5.3.4" id="space_functions">
    <sch:title>Space Functions</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']">
      <sch:assert test="auc:OccupancyClassification" role="">auc:OccupancyClassification</sch:assert>
      <sch:assert test="auc:OriginalOccupancyClassification" role="">auc:OriginalOccupancyClassification</sch:assert>
      <sch:assert test="auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Gross']/auc:FloorAreaValue" role="">auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Gross']/auc:FloorAreaValue</sch:assert>
      <sch:assert test="auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Conditioned']/auc:FloorAreaValue" role="">auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Conditioned']/auc:FloorAreaValue</sch:assert>
      <sch:assert test="auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Gross']/auc:FloorAreaValue &gt;= auc:FloorAreas/auc:FloorArea[auc:FloorAreaType/text() = 'Conditioned']/auc:FloorAreaValue" role="">Conditioned floor area cannot be greater than Gross floor area</sch:assert>
      <sch:assert test="auc:TypicalOccupantUsages/auc:TypicalOccupantUsage[auc:TypicalOccupantUsageUnits/text() = 'Hours per week']" role="">auc:TypicalOccupantUsages/auc:TypicalOccupantUsage[auc:TypicalOccupantUsageUnits/text() = 'Hours per week']</sch:assert>
      <sch:assert test="auc:TypicalOccupantUsages/auc:TypicalOccupantUsage[auc:TypicalOccupantUsageUnits/text() = 'Weeks per year']" role="">auc:TypicalOccupantUsages/auc:TypicalOccupantUsage[auc:TypicalOccupantUsageUnits/text() = 'Weeks per year']</sch:assert>
      <sch:assert test="auc:OccupancyLevels/auc:OccupancyLevel[auc:OccupantQuantityType/text() = 'Peak total occupants' or auc:OccupantQuantityType/text() = 'Normal occupancy']/auc:OccupantQuantity" role="">auc:OccupancyLevels/auc:OccupancyLevel[auc:OccupantQuantityType/text() = 'Peak total occupants' or auc:OccupantQuantityType/text() = 'Normal occupancy']/auc:OccupantQuantity</sch:assert>
      <sch:assert test="//auc:PlugLoad[auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref = current()/@ID]/auc:WeightedAverageLoad" role="">auc:Section[auc:SectionType='Space function'] must have a linked auc:PlugLoad with auc:WeightedAverageLoad</sch:assert>
      <sch:assert test="//auc:HVACSystem[auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref = current()/@ID]/auc:PrincipalHVACSystemType" role="">auc:Section[auc:SectionType='Space function'] must have a linked auc:HVACSystem/auc:PrincipalHVACSystem</sch:assert>
      <sch:assert test="//auc:LightingSystem[auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref = current()/@ID]/auc:LampType" role="">auc:Section[auc:SectionType='Space function'] must have a linked auc:LightingSystem with auc:LampType defined</sch:assert>
      <sch:assert test="//auc:LightingSystem[auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref = current()/@ID]/auc:LampType//auc:LampLabel" role="WARNING">auc:Section[auc:SectionType='Space function'] must have a linked auc:LightingSystem with auc:LampLabel defined</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_general_schedule_requirements">
    <sch:title>Document Structure Prerequisites General Schedule Requirements</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="general_schedule_requirements">
    <sch:title>General Schedule Requirements</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails">
      <sch:let name="scheduleCategory" value="auc:ScheduleDetail[1]/auc:ScheduleCategory"/>
      <sch:assert test="auc:ScheduleDetail" role="">There shoudl be at least one auc:ScheduleDetail in every auc:ScheduleDetails</sch:assert>
      <sch:assert test="count(auc:ScheduleDetail/auc:ScheduleCategory) = count(auc:ScheduleDetail)" role="">Every auc:ScheduleDetail should have an auc:ScheduleCategory</sch:assert>
      <sch:assert test="count(auc:ScheduleDetail[auc:ScheduleCategory/text() = $scheduleCategory]) = count(auc:ScheduleDetail)" role="">All auc:ScheduleDetail within an auc:ScheduleDetails should have the same auc:ScheduleCategory</sch:assert>
      <sch:assert test="auc:ScheduleDetail/auc:DayType/text() = 'Weekday'" role="">auc:ScheduleDetail/auc:DayType/text() = 'Weekday'</sch:assert>
      <sch:assert test="auc:ScheduleDetail/auc:DayType/text() = 'Weekend'" role="">auc:ScheduleDetail/auc:DayType/text() = 'Weekend'</sch:assert>
      <sch:assert test="auc:ScheduleDetail/auc:DayType/text() = 'Holiday'" role="">auc:ScheduleDetail/auc:DayType/text() = 'Holiday'</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail">
      <sch:assert test="auc:DayStartTime" role="">auc:DayStartTime</sch:assert>
      <sch:assert test="auc:DayEndTime" role="">auc:DayEndTime</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_occupancy_schedules">
    <sch:title>Document Structure Prerequisites Occupancy Schedules</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail[auc:ScheduleCategory/text() = 'Occupied']" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail[auc:ScheduleCategory/text() = 'Occupied']</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="occupancy_schedules">
    <sch:title>Occupancy Schedules</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail[auc:ScheduleCategory/text() = 'Occupied']">
      <sch:assert test="auc:PartialOperationPercentage" role="">auc:PartialOperationPercentage</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="generation_systems">
    <sch:title>Generation Systems</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV">
      <sch:assert test="auc:PhotovoltaicSystemMaximumPowerOutput" role="">auc:PhotovoltaicSystemMaximumPowerOutput</sch:assert>
      <sch:assert test="auc:PhotovoltaicSystemInverterEfficiency" role="">auc:PhotovoltaicSystemInverterEfficiency</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other">
      <sch:assert test="auc:OtherEnergyGenerationTechnology" role="">auc:OtherEnergyGenerationTechnology</sch:assert>
      <sch:assert test="auc:OutputResourceType" role="">auc:OutputResourceType</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:EnergyConversionType/auc:Storage/auc:EnergyStorageTechnology]">
      <sch:assert test="auc:Capacity" role="">auc:Capacity</sch:assert>
      <sch:assert test="auc:CapacityUnits" role="">auc:CapacityUnits</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>