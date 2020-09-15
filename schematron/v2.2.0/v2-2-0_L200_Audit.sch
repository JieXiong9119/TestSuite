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
  <sch:phase id="building_envelope_-_roof_and_walls" see="ASHRAE 211 6.2.1.2 (a) (b)">
    <sch:active pattern="document_structure_prerequisites_roof"/>
    <sch:active pattern="roof"/>
    <sch:active pattern="document_structure_prerequisites_walls_-_general_requirements"/>
    <sch:active pattern="walls_-_general_requirements"/>
    <sch:active pattern="document_structure_prerequisites_walls_-_building_sides"/>
    <sch:active pattern="walls_-_building_sides"/>
  </sch:phase>
  <sch:phase id="building_envelope_-_fenestration" see="ASHRAE 211 6.2.1.2 (c)">
    <sch:active pattern="document_structure_prerequisites_fenestration_general_requirements"/>
    <sch:active pattern="fenestration_general_requirements"/>
    <sch:active pattern="document_structure_prerequisites_fenestration_windows"/>
    <sch:active pattern="fenestration_windows"/>
    <sch:active pattern="document_structure_prerequisites_fenestration_doors"/>
    <sch:active pattern="fenestration_doors"/>
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
  <sch:pattern see="" id="document_structure_prerequisites_roof">
    <sch:title>Document Structure Prerequisites Roof</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = &quot;Whole building&quot;]/auc:Roofs/auc:Roof" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = "Whole building"]/auc:Roofs/auc:Roof</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.2.1.2 (a)" id="roof">
    <sch:title>Roof</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem">
      <sch:assert test="auc:RoofConstruction" role="">auc:RoofConstruction</sch:assert>
      <sch:assert test="auc:RoofRValue or auc:RoofUFactor" role="">auc:RoofRValue or auc:RoofUFactor</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = &quot;Whole building&quot;]/auc:Roofs/auc:Roof">
      <sch:assert test="//auc:RoofSystem[@ID = current()/auc:RoofID/@IDref]" role="">Every auc:RoofID within auc:SectionType of "Whole building" must link to a valid auc:RoofSystem's ID</sch:assert>
      <sch:assert test="auc:RoofID/auc:RoofArea" role="">auc:RoofID/auc:RoofArea</sch:assert>
      <sch:assert test="auc:RoofID/auc:RoofCondition" role="">auc:RoofID/auc:RoofCondition</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_walls_-_general_requirements">
    <sch:title>Document Structure Prerequisites Walls - General Requirements</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.2.1.2 (b)" id="walls_-_general_requirements">
    <sch:title>Walls - General Requirements</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building">
      <sch:assert test="auc:TotalExteriorAboveGradeWallArea" role="">auc:TotalExteriorAboveGradeWallArea</sch:assert>
      <sch:assert test="auc:TotalExteriorBelowGradeWallArea" role="">auc:TotalExteriorBelowGradeWallArea</sch:assert>
      <sch:assert test="auc:OverallWindowToWallRatio" role="">auc:OverallWindowToWallRatio</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem">
      <sch:assert test="auc:ExteriorWallConstruction" role="">auc:ExteriorWallConstruction</sch:assert>
      <sch:assert test="auc:WallRValue or auc:WallUFactor" role="">auc:WallRValue or auc:WallUFactor</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]">
      <sch:assert test="auc:FootprintShape" role="">auc:FootprintShape</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_walls_-_building_sides">
    <sch:title>Document Structure Prerequisites Walls - Building Sides</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]/auc:Sides/auc:Side</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:WallIDs/auc:WallID" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]/auc:Sides/auc:Side/auc:WallIDs/auc:WallID</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="walls_-_building_sides">
    <sch:title>Walls - Building Sides</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'Other']">
      <sch:assert test="auc:NumberOfSides" role="">Must provide auc:NumberOfSides if auc:FootprintShape is Other</sch:assert>
      <sch:assert test="auc:NumberOfSides = count(auc:Sides/auc:Side)" role="">auc:NumberOfSides = count(auc:Sides/auc:Side)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'Rectangular']">
      <sch:assert test="count(auc:Sides/auc:Side) = 4" role="">Incorrect number of auc:Side elements for footprint shape "Rectangular" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'L-Shape']">
      <sch:assert test="count(auc:Sides/auc:Side) = 6" role="">Incorrect number of auc:Side elements for footprint shape "L-Shape" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'U-Shape']">
      <sch:assert test="count(auc:Sides/auc:Side) = 8" role="">Incorrect number of auc:Side elements for footprint shape "U-Shape" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'T-Shape']">
      <sch:assert test="count(auc:Sides/auc:Side) = 8" role="">Incorrect number of auc:Side elements for footprint shape "T-Shape" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'H-Shape']">
      <sch:assert test="count(auc:Sides/auc:Side) = 12" role="">Incorrect number of auc:Side elements for footprint shape "H-Shape" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot; and auc:FootprintShape/text() = 'O-Shape']">
      <sch:assert test="count(auc:Sides/auc:Side) = 8" role="">Incorrect number of auc:Side elements for footprint shape "O-Shape" (found <sch:value-of select="count(auc:Sides/auc:Side)"/>)</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side">
      <sch:assert test="auc:WallIDs" role="">auc:WallIDs</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:WallIDs/auc:WallID">
      <sch:assert test="//auc:WallSystem[@ID = current()/@IDref]" role="">auc:WallID in auc:Side should link to an auc:WallSystem's ID</sch:assert>
      <sch:assert test="auc:WallArea" role="">auc:WallArea</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_fenestration_general_requirements">
    <sch:title>Document Structure Prerequisites Fenestration General Requirements</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]/auc:Sides/auc:Side</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:WindowIDs/auc:WindowID" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]/auc:Sides/auc:Side/auc:WindowIDs/auc:WindowID</sch:assert>
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:DoorIDs/auc:DoorID" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = "Whole building"]/auc:Sides/auc:Side/auc:DoorIDs/auc:DoorID</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="fenestration_general_requirements">
    <sch:title>Fenestration General Requirements</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building">
      <sch:assert test="auc:OverallWindowToWallRatio" role="">auc:OverallWindowToWallRatio</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:WindowIDs/auc:WindowID[@IDref = current()/@ID]" role="">Each auc:Window must be linked to an auc:Side</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:DoorIDs/auc:DoorID[@IDref = current()/@ID]" role="">Each auc:Door must be linked to an auc:Side</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side">
      <sch:assert test="auc:WindowIDs/auc:WindowID" role="WARNING">Found an auc:Side with no linked auc:Window</sch:assert>
      <sch:assert test="auc:DoorIDs/auc:DoorID" role="WARNING">Found an auc:Side with no linked auc:Door</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:WindowIDs/auc:WindowID">
      <sch:assert test="//auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window and @ID = current()/@IDref]" role="">An auc:Side element's auc:WindowIDs/auc:WindowID must point to a valid auc:FenestrationSystem</sch:assert>
      <sch:assert test="auc:FenestrationArea or auc:WindowToWallRatio" role="">auc:FenestrationArea or auc:WindowToWallRatio</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = &quot;Whole building&quot;]/auc:Sides/auc:Side/auc:DoorIDs/auc:DoorID">
      <sch:assert test="//auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door and @ID = current()/@IDref]" role="">An auc:Side element's auc:DoorIDs/auc:DoorID must point to a valid auc:FenestrationSystem</sch:assert>
      <sch:assert test="auc:FenestrationArea" role="">auc:FenestrationArea</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_fenestration_windows">
    <sch:title>Document Structure Prerequisites Fenestration Windows</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.2.1.2 (c)" id="fenestration_windows">
    <sch:title>Fenestration Windows</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]">
      <sch:assert test="auc:FenestrationFrameMaterial" role="">auc:FenestrationFrameMaterial</sch:assert>
      <sch:assert test="auc:GlassType" role="">auc:GlassType</sch:assert>
      <sch:assert test="auc:FenestrationGlassLayers" role="">auc:FenestrationGlassLayers</sch:assert>
      <sch:assert test="auc:FenestrationRValue or auc:FenestrationUFactor" role="">auc:FenestrationRValue or auc:FenestrationUFactor</sch:assert>
      <sch:assert test="auc:SolarHeatGainCoefficient" role="WARNING">auc:SolarHeatGainCoefficient</sch:assert>
      <sch:assert test="auc:VisibleTransmittance" role="WARNING">auc:VisibleTransmittance</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="" id="document_structure_prerequisites_fenestration_doors">
    <sch:title>Document Structure Prerequisites Fenestration Doors</sch:title>
    <sch:rule context="/">
      <sch:assert test="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]" role="ERROR">/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern see="ASHRAE 211 6.2.1.2 (c)" id="fenestration_doors">
    <sch:title>Fenestration Doors</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]">
      <sch:assert test="auc:FenestrationType/auc:Door/auc:ExteriorDoorType" role="">auc:FenestrationType/auc:Door/auc:ExteriorDoorType</sch:assert>
      <sch:assert test="auc:FenestrationFrameMaterial" role="">auc:FenestrationFrameMaterial</sch:assert>
      <sch:assert test="auc:FenestrationRValue or auc:FenestrationUFactor" role="">auc:FenestrationRValue or auc:FenestrationUFactor</sch:assert>
      <sch:assert test="auc:FenestrationType/auc:Door/auc:DoorGlazedAreaFraction" role="">auc:FenestrationType/auc:Door/auc:DoorGlazedAreaFraction</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
