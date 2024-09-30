<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" version="3.28.8-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol is_animated="0" force_rhr="0" name="0" frame_rate="10" type="marker" clip_to_extent="1" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="GeometryGenerator" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option value="Fill" name="SymbolType" type="QString"/>
            <Option value="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- CASE statement with reusable variables&#xd;&#xa;CASE&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A4' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 250, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 270, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 250, @y + 150),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 250, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 270, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 250, @y + 150),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;&#x9;&#x9;&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A4' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 9, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 8, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 8, @y + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A3' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 18.5),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 18.5),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 18.5),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 18, @y - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 18, @y - &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 18, @y + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;END&#xd;&#xa;))&#xd;&#xa;" name="geometryModifier" type="QString"/>
            <Option value="MapUnit" name="units" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@0@0" frame_rate="10" type="fill" clip_to_extent="1" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" pass="0" enabled="1" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale" type="QString"/>
                <Option value="255,0,4,26" name="color" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="228,26,28,255" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="1" name="outline_width" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="solid" name="style" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer class="GeometryGenerator" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option value="Marker" name="SymbolType" type="QString"/>
            <Option value="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- create the point&#xd;&#xa;make_point(@x, @y)&#xd;&#xa;))" name="geometryModifier" type="QString"/>
            <Option value="MapUnit" name="units" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@0@1" frame_rate="10" type="marker" clip_to_extent="1" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="255,1,1,255" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="0,0,0,255" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0.4" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="3" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style forcedBold="0" previewBkgrdColor="255,255,255,255" textColor="0,0,0,255" useSubstitutions="0" allowHtml="0" capitalization="0" blendMode="0" fontWeight="50" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontKerning="1" textOpacity="1" textOrientation="horizontal" fontFamily="Arial" fontSize="12" multilineHeight="1" namedStyle="Standard" fontItalic="0" legendString="Aa" fontUnderline="0" fontLetterSpacing="0" fontStrikeout="0" multilineHeightUnit="Percentage" fieldName="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- create string&#xd;&#xa; &quot;RasterName&quot;  ||  '\n' || '('  ||   &quot;PageSize&quot;  || ' - ' ||  &quot;PageOrientation&quot;  || ') '  ||  '\n' || &#xd;&#xa; '1:' ||  &quot;Scale&quot;   ||  '\n' ||  @x || ' / '  || @y&#xd;&#xa;))" fontWordSpacing="0" forcedItalic="0" isExpression="1" fontSizeUnit="RenderMetersInMapUnits">
        <families/>
        <text-buffer bufferSize="1.2" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferOpacity="1" bufferBlendMode="0" bufferNoFill="1" bufferDraw="1" bufferSizeUnits="MM" bufferColor="255,255,255,255"/>
        <text-mask maskSizeUnits="MM" maskType="0" maskEnabled="0" maskOpacity="1" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSize="0" maskJoinStyle="128" maskedSymbolLayers=""/>
        <background shapeBlendMode="0" shapeSVGFile="" shapeBorderWidthUnit="Point" shapeOffsetUnit="Point" shapeSizeY="0" shapeRotation="0" shapeOffsetX="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeSizeUnit="Point" shapeOffsetY="0" shapeDraw="0" shapeSizeX="0" shapeJoinStyle="64" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeType="0" shapeRadiiX="0" shapeRotationType="0" shapeOpacity="1" shapeRadiiUnit="Point" shapeFillColor="255,255,255,255">
          <symbol is_animated="0" force_rhr="0" name="markerSymbol" frame_rate="10" type="marker" clip_to_extent="1" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="196,60,57,255" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol is_animated="0" force_rhr="0" name="fillSymbol" frame_rate="10" type="fill" clip_to_extent="1" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" pass="0" enabled="1" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale" type="QString"/>
                <Option value="255,255,255,255" name="color" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="128,128,128,255" name="outline_color" type="QString"/>
                <Option value="no" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="Point" name="outline_width_unit" type="QString"/>
                <Option value="solid" name="style" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetAngle="135" shadowScale="100" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetDist="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowRadius="1.5" shadowOpacity="0.69999999999999996" shadowColor="0,0,0,255" shadowDraw="0" shadowUnder="0" shadowRadiusAlphaOnly="0" shadowOffsetGlobal="1"/>
        <dd_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="3" wrapChar="" placeDirectionSymbol="0" rightDirectionSymbol=">" decimals="3" useMaxLineLengthForAutoWrap="1" plussign="0" formatNumbers="0" reverseDirectionSymbol="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" autoWrapLength="0"/>
      <placement layerType="PointGeometry" rotationUnit="AngleDegrees" polygonPlacementFlags="2" preserveRotation="1" geometryGeneratorEnabled="0" quadOffset="7" overrunDistance="0" geometryGeneratorType="PointGeometry" dist="0" xOffset="0" fitInPolygonOnly="0" yOffset="2" offsetUnits="MM" placementFlags="10" priority="5" lineAnchorType="0" lineAnchorClipping="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" overrunDistanceUnit="MM" centroidWhole="0" overlapHandling="PreventOverlap" centroidInside="0" placement="1" distUnits="MM" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" maxCurvedCharAngleIn="25" lineAnchorTextPoint="CenterOfText" lineAnchorPercent="0.5" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0" allowDegraded="0" rotationAngle="0" geometryGenerator="" repeatDistanceUnits="MM" maxCurvedCharAngleOut="-25" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0"/>
      <rendering fontMinPixelSize="3" upsidedownLabels="0" fontLimitPixelSize="0" maxNumLabels="2000" fontMaxPixelSize="10000" unplacedVisibility="0" zIndex="0" scaleMax="0" mergeLines="0" minFeatureSize="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" drawLabels="1" scaleVisibility="0" obstacleType="1" scaleMin="0" labelPerPart="0"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" name="name" type="QString"/>
          <Option name="properties" type="Map">
            <Option name="Size" type="Map">
              <Option value="true" name="active" type="bool"/>
              <Option value="CASE&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100 &#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#xd;&#xa;END" name="expression" type="QString"/>
              <Option value="3" name="type" type="int"/>
            </Option>
          </Option>
          <Option value="collection" name="type" type="QString"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option value="pole_of_inaccessibility" name="anchorPoint" type="QString"/>
          <Option value="0" name="blendMode" type="int"/>
          <Option name="ddProperties" type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
          <Option value="false" name="drawToAllParts" type="bool"/>
          <Option value="0" name="enabled" type="QString"/>
          <Option value="point_on_exterior" name="labelAnchorPoint" type="QString"/>
          <Option value="&lt;symbol is_animated=&quot;0&quot; force_rhr=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; name=&quot;name&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; name=&quot;type&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; pass=&quot;0&quot; enabled=&quot;1&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; name=&quot;align_dash_pattern&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;square&quot; name=&quot;capstyle&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;5;2&quot; name=&quot;customdash&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;customdash_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;dash_pattern_offset&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;draw_inside_polygon&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;bevel&quot; name=&quot;joinstyle&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;60,60,60,255&quot; name=&quot;line_color&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;solid&quot; name=&quot;line_style&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0.3&quot; name=&quot;line_width&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;line_width_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;offset&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;offset_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;ring_filter&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;trim_distance_end&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;trim_distance_start&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;0&quot; name=&quot;use_custom_dash&quot; type=&quot;QString&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; name=&quot;name&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; name=&quot;type&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol" type="QString"/>
          <Option value="0" name="minLength" type="double"/>
          <Option value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale" type="QString"/>
          <Option value="MM" name="minLengthUnit" type="QString"/>
          <Option value="0" name="offsetFromAnchor" type="double"/>
          <Option value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale" type="QString"/>
          <Option value="MM" name="offsetFromAnchorUnit" type="QString"/>
          <Option value="0" name="offsetFromLabel" type="double"/>
          <Option value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale" type="QString"/>
          <Option value="MM" name="offsetFromLabelUnit" type="QString"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <previewExpression>"RasterName"</previewExpression>
  <layerGeometryType>0</layerGeometryType>
</qgis>
