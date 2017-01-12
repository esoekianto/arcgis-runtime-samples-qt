#-------------------------------------------------
# Copyright 2015 Esri.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#-------------------------------------------------


TEMPLATE = app

QT += qml quick sensors positioning

CONFIG += c++11 arcgis_runtime_qml100_1

SOURCES += main.cpp

RESOURCES += DeleteFeaturesFeatureService.qrc

ios {
    QMAKE_INFO_PLIST = $$PWD/Info.plist
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
