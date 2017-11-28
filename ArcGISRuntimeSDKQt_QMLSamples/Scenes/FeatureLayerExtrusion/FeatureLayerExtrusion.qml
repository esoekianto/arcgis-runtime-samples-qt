// [WriteFile Name=FeatureLayerExtrusion, Category=Analysis]
// [Legal]
// Copyright 2017 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// [Legal]


import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Esri.ArcGISRuntime 100.2

Rectangle {
    id: rootRectangle
    clip: true
    width: 800
    height: 600

    SceneView {
        id: sceneView
        anchors.fill: parent
        cameraController: orbCamCont
        currentViewpointCenter.camera: cam

        Scene {
            id: scene
            BasemapImagery {}

            ServiceFeatureTable {
                id: featureTable
                url: "http://sampleserver6.arcgisonline.com/arcgis/rest/services/Census/MapServer/3"

                Component.onCompleted: {
                    //queryFeatures(queryParameters);

                    //populateFromService(queryParameters,true,
                }
            }

            QueryParameters {
                id: queryParameters
                whereClause: "1=1"

            }


            FeatureLayer {
                id: featureLayer
                featureTable: featureTable
                renderingMode: Enums.FeatureRenderingModeDynamic

                renderer: renderer
            }

            Surface {
                id: baseSurface
                ArcGISTiledElevationSource {
                    url: "http://elevation3d.arcgis.com/arcgis/rest/services/WorldElevation3D/Terrain3D/ImageServer"
                }
            }

        }


            SimpleRenderer {
                id: renderer
                symbol: fillSymbol
                sceneProperties: sceneProperties
            }

            RendererSceneProperties {
                id: sceneProperties
                extrusionMode: Enums.ExtrusionModeBaseHeight
                extrusionExpression: "[POP2007] / 10"
            }

            SimpleFillSymbol {
                id: fillSymbol
                color: "Blue"
                outline: lineSymbol
            }

            SimpleLineSymbol {
                id: lineSymbol
                color: "Blue"
            }

            Camera {
                id: cam
                location: lookAtPoint
                distance: 20000000.0
                heading: 0.0
                pitch: 55.0
                roll: 0.0
            }

            Point {
                id: lookAtPoint
                x: -10974490.0
                y: 4814376
                spatialReference: SpatialReference.createWebMercator()

            }

            OrbitLocationCameraController{
                id: orbCamCont
                targetLocation: lookAtPoint
                cameraDistance: 20000000.0
            }



    }
}
