<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="0" simplifyMaxScale="1" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0" maxScale="0" simplifyDrawingTol="1" simplifyDrawingHints="0" symbologyReferenceScale="-1" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|AttributeTable|Rendering" version="3.22.4-Białowieża" labelsEnabled="1" readOnly="0" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" referencescale="-1" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol force_rhr="0" alpha="1" type="marker" clip_to_extent="1" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" enabled="1" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" name="SymbolType" value="Fill"/>
            <Option type="QString" name="geometryModifier" value="&#xd;&#xa;CASE&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 9, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 9, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 9, y($geometry) + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) + &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 18.7),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 18.7),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) + &quot;Scale&quot;/100 * 18.3),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 18.7, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 18.7, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 18.3, y($geometry) + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#xd;&#xa;END&#xd;&#xa;"/>
            <Option type="QString" name="units" value="MapUnit"/>
          </Option>
          <prop k="SymbolType" v="Fill"/>
          <prop k="geometryModifier" v="&#xd;&#xa;CASE&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 9, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 9, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 9, y($geometry) + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) + &quot;Scale&quot;/100 * 9),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 18.7),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) - &quot;Scale&quot;/100 * 18.7),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 13, y($geometry) + &quot;Scale&quot;/100 * 18.3),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) - &quot;Scale&quot;/100 * 18.7, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 18.7, y($geometry) - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(x($geometry) + &quot;Scale&quot;/100 * 18.3, y($geometry) + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0&#x9;&#xd;&#xa;&#x9;&#x9;)&#xd;&#xa;END&#xd;&#xa;"/>
          <prop k="units" v="MapUnit"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" alpha="1" type="fill" clip_to_extent="1" name="@0@0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" name="align_dash_pattern" value="0"/>
                <Option type="QString" name="capstyle" value="square"/>
                <Option type="QString" name="customdash" value="5;2"/>
                <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="customdash_unit" value="Pixel"/>
                <Option type="QString" name="dash_pattern_offset" value="0"/>
                <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
                <Option type="QString" name="draw_inside_polygon" value="0"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="line_color" value="228,26,28,255"/>
                <Option type="QString" name="line_style" value="solid"/>
                <Option type="QString" name="line_width" value="2"/>
                <Option type="QString" name="line_width_unit" value="Pixel"/>
                <Option type="QString" name="offset" value="0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="Pixel"/>
                <Option type="QString" name="ring_filter" value="0"/>
                <Option type="QString" name="trim_distance_end" value="0"/>
                <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_end_unit" value="MM"/>
                <Option type="QString" name="trim_distance_start" value="0"/>
                <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_start_unit" value="MM"/>
                <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
                <Option type="QString" name="use_custom_dash" value="0"/>
                <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
              <prop k="align_dash_pattern" v="0"/>
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="Pixel"/>
              <prop k="dash_pattern_offset" v="0"/>
              <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="dash_pattern_offset_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="228,26,28,255"/>
              <prop k="line_style" v="solid"/>
              <prop k="line_width" v="2"/>
              <prop k="line_width_unit" v="Pixel"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="Pixel"/>
              <prop k="ring_filter" v="0"/>
              <prop k="trim_distance_end" v="0"/>
              <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="trim_distance_end_unit" v="MM"/>
              <prop k="trim_distance_start" v="0"/>
              <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="trim_distance_start_unit" v="MM"/>
              <prop k="tweak_dash_pattern_on_corners" v="0"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="255,0,0,255"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="cross2"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,35,35,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="1"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="255,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="cross2"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style fontKerning="1" fontWordSpacing="0" textOrientation="horizontal" fontLetterSpacing="0" fontWeight="50" multilineHeight="1" isExpression="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" previewBkgrdColor="255,255,255,255" fontFamily="Arial" textColor="255,1,238,255" fontUnderline="0" blendMode="0" capitalization="0" fontSize="12" useSubstitutions="0" textOpacity="1" fontItalic="0" namedStyle="Regular" allowHtml="0" fontSizeUnit="RenderMetersInMapUnits" fontStrikeout="0" legendString="Aa" fieldName=" &quot;RasterName&quot;  ||  '\n' || '('  ||   &quot;PageSize&quot;  || ' - ' ||  &quot;PageOrientation&quot;  || ') '  ||  '\n' || &#xd;&#xa; '1:' ||  &quot;Scale&quot;   ||  '\n' ||  &#xd;&#xa; round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056')),0) ||&#xd;&#xa; ' / '  ||  &#xd;&#xa; round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056')),0)&#xd;&#xa;">
        <families/>
        <text-buffer bufferSize="1.2" bufferColor="255,255,255,255" bufferNoFill="1" bufferJoinStyle="128" bufferDraw="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSizeUnits="MM" bufferOpacity="1"/>
        <text-mask maskOpacity="1" maskedSymbolLayers="" maskType="0" maskJoinStyle="128" maskSize="0" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
        <background shapeOffsetY="0" shapeBorderWidthUnit="Point" shapeOffsetX="0" shapeRotation="0" shapeRotationType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeRadiiUnit="Point" shapeSizeY="0" shapeBorderWidth="0" shapeSVGFile="" shapeSizeX="0" shapeOffsetUnit="Point" shapeOpacity="1" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeSizeUnit="Point">
          <symbol force_rhr="0" alpha="1" type="marker" clip_to_extent="1" name="markerSymbol">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="196,60,57,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <prop k="angle" v="0"/>
              <prop k="cap_style" v="square"/>
              <prop k="color" v="196,60,57,255"/>
              <prop k="horizontal_anchor_point" v="1"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="name" v="circle"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="35,35,35,255"/>
              <prop k="outline_style" v="solid"/>
              <prop k="outline_width" v="0"/>
              <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="outline_width_unit" v="MM"/>
              <prop k="scale_method" v="diameter"/>
              <prop k="size" v="2"/>
              <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="size_unit" v="MM"/>
              <prop k="vertical_anchor_point" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol force_rhr="0" alpha="1" type="fill" clip_to_extent="1" name="fillSymbol">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="255,255,255,255"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="128,128,128,255"/>
                <Option type="QString" name="outline_style" value="no"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_unit" value="Point"/>
                <Option type="QString" name="style" value="solid"/>
              </Option>
              <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="color" v="255,255,255,255"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="128,128,128,255"/>
              <prop k="outline_style" v="no"/>
              <prop k="outline_width" v="0"/>
              <prop k="outline_width_unit" v="Point"/>
              <prop k="style" v="solid"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetAngle="135" shadowRadius="1.5" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOpacity="0.69999999999999996" shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowDraw="0" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetDist="1" shadowRadiusAlphaOnly="0"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format placeDirectionSymbol="0" plussign="0" wrapChar="" reverseDirectionSymbol="0" formatNumbers="0" rightDirectionSymbol=">" leftDirectionSymbol="&lt;" decimals="3" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" multilineAlign="3"/>
      <placement rotationAngle="0" maxCurvedCharAngleIn="25" lineAnchorPercent="0.5" repeatDistance="0" dist="0" geometryGenerator="" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" placement="1" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" lineAnchorType="0" yOffset="2" repeatDistanceUnits="MM" geometryGeneratorEnabled="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" maxCurvedCharAngleOut="-25" offsetUnits="MM" rotationUnit="AngleDegrees" lineAnchorClipping="0" overrunDistance="0" fitInPolygonOnly="0" offsetType="0" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" overrunDistanceUnit="MM" distUnits="MM" layerType="PointGeometry" preserveRotation="1" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="7" placementFlags="10"/>
      <rendering scaleMax="0" obstacle="1" labelPerPart="0" scaleMin="0" obstacleType="1" limitNumLabels="0" displayAll="0" minFeatureSize="0" unplacedVisibility="0" upsidedownLabels="0" fontMaxPixelSize="10000" fontMinPixelSize="3" obstacleFactor="1" maxNumLabels="2000" zIndex="0" scaleVisibility="0" drawLabels="1" mergeLines="0" fontLimitPixelSize="0"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Size">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="CASE&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100 &#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#xd;&#xa;END"/>
              <Option type="int" name="type" value="3"/>
            </Option>
          </Option>
          <Option type="QString" name="type" value="collection"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
          <Option type="int" name="blendMode" value="0"/>
          <Option type="Map" name="ddProperties">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
          <Option type="bool" name="drawToAllParts" value="false"/>
          <Option type="QString" name="enabled" value="0"/>
          <Option type="QString" name="labelAnchorPoint" value="point_on_exterior"/>
          <Option type="QString" name="lineSymbol" value="&lt;symbol force_rhr=&quot;0&quot; alpha=&quot;1&quot; type=&quot;line&quot; clip_to_extent=&quot;1&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;align_dash_pattern&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;capstyle&quot; value=&quot;square&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash&quot; value=&quot;5;2&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;joinstyle&quot; value=&quot;bevel&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_color&quot; value=&quot;60,60,60,255&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_style&quot; value=&quot;solid&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width&quot; value=&quot;0.3&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;ring_filter&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;use_custom_dash&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;prop k=&quot;align_dash_pattern&quot; v=&quot;0&quot;/>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;dash_pattern_offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;dash_pattern_offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;dash_pattern_offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;trim_distance_end&quot; v=&quot;0&quot;/>&lt;prop k=&quot;trim_distance_end_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;trim_distance_end_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;trim_distance_start&quot; v=&quot;0&quot;/>&lt;prop k=&quot;trim_distance_start_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;trim_distance_start_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;tweak_dash_pattern_on_corners&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
          <Option type="double" name="minLength" value="0"/>
          <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="minLengthUnit" value="MM"/>
          <Option type="double" name="offsetFromAnchor" value="0"/>
          <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
          <Option type="double" name="offsetFromLabel" value="0"/>
          <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <fieldConfiguration>
    <field name="RasterName" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="Scale" configurationFlags="None">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="1:2500" value="2500"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="1:5'000" value="5000"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="1:10'000" value="10000"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="1:25'000" value="25000"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PageSize" configurationFlags="None">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="A4" value="A4"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="A3" value="A3"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PageOrientation" configurationFlags="None">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="Landscape" value="Landscape"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Portrait" value="Portrait"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="RasterName"/>
    <alias index="1" name="" field="Scale"/>
    <alias index="2" name="" field="PageSize"/>
    <alias index="3" name="" field="PageOrientation"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="RasterName"/>
    <default applyOnUpdate="0" expression="" field="Scale"/>
    <default applyOnUpdate="0" expression="" field="PageSize"/>
    <default applyOnUpdate="0" expression="" field="PageOrientation"/>
  </defaults>
  <constraints>
    <constraint constraints="1" exp_strength="0" notnull_strength="2" unique_strength="0" field="RasterName"/>
    <constraint constraints="1" exp_strength="0" notnull_strength="2" unique_strength="0" field="Scale"/>
    <constraint constraints="1" exp_strength="0" notnull_strength="2" unique_strength="0" field="PageSize"/>
    <constraint constraints="1" exp_strength="0" notnull_strength="2" unique_strength="0" field="PageOrientation"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="RasterName"/>
    <constraint exp="" desc="" field="Scale"/>
    <constraint exp="" desc="" field="PageSize"/>
    <constraint exp="" desc="" field="PageOrientation"/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column width="-1" type="field" hidden="0" name="RasterName"/>
      <column width="-1" type="field" hidden="0" name="Scale"/>
      <column width="-1" type="field" hidden="0" name="PageSize"/>
      <column width="-1" type="field" hidden="0" name="PageOrientation"/>
      <column width="-1" type="actions" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="PageOrientation"/>
    <field editable="1" name="PageSize"/>
    <field editable="1" name="RasterName"/>
    <field editable="1" name="Scale"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="PageOrientation"/>
    <field labelOnTop="0" name="PageSize"/>
    <field labelOnTop="0" name="RasterName"/>
    <field labelOnTop="0" name="Scale"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="PageOrientation" reuseLastValue="0"/>
    <field name="PageSize" reuseLastValue="0"/>
    <field name="RasterName" reuseLastValue="0"/>
    <field name="Scale" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"RasterName"</previewExpression>
  <layerGeometryType>0</layerGeometryType>
</qgis>
