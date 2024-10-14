<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.11-Prizren" styleCategories="Symbology|Labeling|Fields|Forms" labelsEnabled="1">
  <renderer-v2 forceraster="0" type="singleSymbol" referencescale="-1" enableorderby="0" symbollevels="0">
    <symbols>
      <symbol clip_to_extent="1" frame_rate="10" type="marker" alpha="1" name="0" force_rhr="0" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="GeometryGenerator" pass="0" id="{2ea5b03f-5402-4060-89d1-8ab6d3306167}" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="Fill" name="SymbolType"/>
            <Option type="QString" value="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- CASE statement with reusable variables&#xd;&#xa;CASE&#xd;&#xa;&#x9;-- A4&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A4' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 200, @y - 250),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 140, @y - 250),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 140, @y + 250),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 250, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 270, @y - 170),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 250, @y + 150),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 8),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A4' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 9, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 8, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 8, @y + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;-- A3&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A3' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 250, @y - 390),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 270, @y - 390),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 270, @y + 350),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3' AND &quot;Scale&quot; = '2000' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - 350, @y - 250),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 410, @y - 250),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + 410, @y + 250),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 19, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 19, @y - &quot;Scale&quot;/100 * 12),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 19, @y + &quot;Scale&quot;/100 * 13),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;&#x9;WHEN &quot;PageOrientation&quot; = 'Portrait' AND &quot;PageSize&quot; = 'A3' THEN&#xd;&#xa;&#x9;&#x9;make_rectangle_3points(&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y - &quot;Scale&quot;/100 * 19),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x - &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 18),&#xd;&#xa;&#x9;&#x9;&#x9;make_point(@x + &quot;Scale&quot;/100 * 13, @y + &quot;Scale&quot;/100 * 18),&#xd;&#xa;&#x9;&#x9;&#x9;0)&#xd;&#xa;END&#xd;&#xa;))&#xd;&#xa;" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" frame_rate="10" type="fill" alpha="1" name="@0@0" force_rhr="0" is_animated="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" pass="0" id="{f22d80c2-7836-4352-80d0-96373ddc84a4}" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="255,0,4,26" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="228,26,28,255" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer class="GeometryGenerator" pass="0" id="{40764b53-35d4-41be-9169-578bf89e102e}" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="Marker" name="SymbolType"/>
            <Option type="QString" value="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- create the point&#xd;&#xa;make_point(@x, @y)&#xd;&#xa;))" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" frame_rate="10" type="marker" alpha="1" name="@0@1" force_rhr="0" is_animated="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" pass="0" id="{0c8532d5-0be8-4767-8f3b-8e842a01d019}" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="255,1,1,255" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0,0,0,255" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.4" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="3" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
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
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol clip_to_extent="1" frame_rate="10" type="marker" alpha="1" name="" force_rhr="0" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" id="{4041e14f-6f4e-48ea-868a-5abe1d504040}" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="255,0,0,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style fontSize="12" blendMode="0" capitalization="0" fontKerning="1" textOrientation="horizontal" namedStyle="Standard" isExpression="1" previewBkgrdColor="255,255,255,255" useSubstitutions="0" legendString="Aa" multilineHeight="1" forcedBold="0" fontWeight="50" forcedItalic="0" fontStrikeout="0" fontWordSpacing="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="0,0,0,255" allowHtml="0" fontSizeUnit="RenderMetersInMapUnits" fontItalic="0" fieldName="-- Define x and y once at the beginning&#xd;&#xa; with_variable('x',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(x(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END,&#xd;&#xa;&#xd;&#xa;with_variable('y',&#xd;&#xa;&#x9;round( -- round to grid size&#xd;&#xa;&#x9;&#x9;round(y(transform($geometry, 'EPSG:your_current_crs', 'EPSG:2056'))) --get rid of decimal numbers&#xd;&#xa;&#x9;&#x9;/ &#xd;&#xa;&#x9;&#x9;(CASE&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;&#x9;END)&#xd;&#xa;&#x9;) * &#xd;&#xa;&#x9;CASE&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 25000 THEN 250&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;)  = 10000 THEN 100&#xd;&#xa;&#x9;&#x9;WHEN  round(&quot;Scale&quot;) &lt;=  5000 THEN  50&#xd;&#xa;&#x9;END, &#xd;&#xa;&#xd;&#xa;-- create string&#xd;&#xa; &quot;RasterName&quot;  ||  '\n' || '('  ||   &quot;PageSize&quot;  || ' - ' ||  &quot;PageOrientation&quot;  || ') '  ||  '\n' || &#xd;&#xa; '1:' ||  &quot;Scale&quot;   ||  '\n' ||  @x || ' / '  || @y&#xd;&#xa;))" fontUnderline="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" textOpacity="1" fontFamily="Arial">
        <families/>
        <text-buffer bufferNoFill="1" bufferDraw="1" bufferColor="255,255,255,255" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferSize="1.2" bufferJoinStyle="128" bufferSizeUnits="MM"/>
        <text-mask maskSize2="1.5" maskSizeUnits="MM" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskedSymbolLayers="" maskJoinStyle="128" maskOpacity="1"/>
        <background shapeSizeX="0" shapeRotation="0" shapeRadiiUnit="Point" shapeOpacity="1" shapeSizeUnit="Point" shapeRadiiX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeType="0" shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeBorderWidthUnit="Point" shapeType="0" shapeBlendMode="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeY="0" shapeOffsetX="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeJoinStyle="64" shapeSVGFile="" shapeOffsetUnit="Point" shapeRotationType="0" shapeBorderWidth="0" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0">
          <symbol clip_to_extent="1" frame_rate="10" type="marker" alpha="1" name="markerSymbol" force_rhr="0" is_animated="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" pass="0" id="" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="196,60,57,255" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="2" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol clip_to_extent="1" frame_rate="10" type="fill" alpha="1" name="fillSymbol" force_rhr="0" is_animated="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" pass="0" id="" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="255,255,255,255" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="128,128,128,255" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowOffsetGlobal="1" shadowBlendMode="6" shadowColor="0,0,0,255" shadowScale="100" shadowDraw="0" shadowUnder="0" shadowRadiusAlphaOnly="0" shadowRadiusUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" rightDirectionSymbol=">" placeDirectionSymbol="0" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" plussign="0" decimals="3" wrapChar="" multilineAlign="3" formatNumbers="0"/>
      <placement polygonPlacementFlags="2" maxCurvedCharAngleOut="-25" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" fitInPolygonOnly="0" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="0" allowDegraded="0" lineAnchorType="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" centroidWhole="0" lineAnchorTextPoint="CenterOfText" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" layerType="PointGeometry" distUnits="MM" offsetType="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorPercent="0.5" offsetUnits="MM" centroidInside="0" geometryGeneratorType="PointGeometry" rotationUnit="AngleDegrees" preserveRotation="1" rotationAngle="0" quadOffset="7" priority="5" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" dist="0" overrunDistanceUnit="MM" repeatDistance="0" placementFlags="10" xOffset="0" geometryGenerator="" yOffset="2" overrunDistance="0" lineAnchorClipping="0"/>
      <rendering fontMinPixelSize="3" scaleMax="0" zIndex="0" unplacedVisibility="0" fontMaxPixelSize="10000" fontLimitPixelSize="0" maxNumLabels="2000" obstacleType="1" minFeatureSize="0" mergeLines="0" scaleVisibility="0" drawLabels="1" scaleMin="0" limitNumLabels="0" labelPerPart="0" obstacleFactor="1" obstacle="1" upsidedownLabels="0"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Size">
              <Option type="bool" value="true" name="active"/>
              <Option type="QString" value="CASE&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100 &#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A4'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Portrait'  AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/100&#x9;&#x9;&#xd;&#xa;&#x9;WHEN  &quot;PageOrientation&quot; = 'Landscape' AND &quot;PageSize&quot; = 'A3'  THEN &#xd;&#xa;&#x9;&#x9;&#x9;&quot;Scale&quot;/1000 * 15&#x9;&#xd;&#xa;END" name="expression"/>
              <Option type="int" value="3" name="type"/>
            </Option>
          </Option>
          <Option type="QString" value="collection" name="type"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
          <Option type="int" value="0" name="blendMode"/>
          <Option type="Map" name="ddProperties">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
          <Option type="bool" value="false" name="drawToAllParts"/>
          <Option type="QString" value="0" name="enabled"/>
          <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
          <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; alpha=&quot;1&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; pass=&quot;0&quot; id=&quot;{f43c354e-af30-4b2e-be53-4df2d7028d69}&quot; enabled=&quot;1&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
          <Option type="double" value="0" name="minLength"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
          <Option type="QString" value="MM" name="minLengthUnit"/>
          <Option type="double" value="0" name="offsetFromAnchor"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
          <Option type="double" value="0" name="offsetFromLabel"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <fieldConfiguration>
    <field configurationFlags="NoFlag" name="RasterName">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="Scale">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="25000" name="1:25'000"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="10000" name="1:10'000"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="5000" name="1:5'000"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="2000" name="1:2'000"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="PageSize">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="A4" name="A4"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="A3" name="A3"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="PageOrientation">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Landscape" name="Landscape / Quer"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Portrait" name="Portrait / Hoch"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="RasterName" index="0" name="Rastername"/>
    <alias field="Scale" index="1" name=""/>
    <alias field="PageSize" index="2" name=""/>
    <alias field="PageOrientation" index="3" name=""/>
  </aliases>
  <splitPolicies>
    <policy field="RasterName" policy="DefaultValue"/>
    <policy field="Scale" policy="DefaultValue"/>
    <policy field="PageSize" policy="DefaultValue"/>
    <policy field="PageOrientation" policy="DefaultValue"/>
  </splitPolicies>
  <defaults>
    <default field="RasterName" applyOnUpdate="0" expression=""/>
    <default field="Scale" applyOnUpdate="0" expression=""/>
    <default field="PageSize" applyOnUpdate="0" expression=""/>
    <default field="PageOrientation" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="RasterName" unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1"/>
    <constraint field="Scale" unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1"/>
    <constraint field="PageSize" unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1"/>
    <constraint field="PageOrientation" unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="RasterName" desc=""/>
    <constraint exp="" field="Scale" desc=""/>
    <constraint exp="" field="PageSize" desc=""/>
    <constraint exp="" field="PageOrientation" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS-Formulare können eine Python-Funktion haben,, die aufgerufen wird, wenn sich das Formular öffnet

Diese Funktion kann verwendet werden um dem Formular Extralogik hinzuzufügen.

Der Name der Funktion wird im Feld "Python Init-Function" angegeben
Ein Beispiel folgt:
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
  <layerGeometryType>0</layerGeometryType>
</qgis>
