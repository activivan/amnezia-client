import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import PageEnum 1.0

import "./"
import "../Controls2"
import "../Controls2/TextTypes"
import "../Config"

PageType {
    id: root

    defaultActiveFocusItem: textKey.textField


    Item {
        id: focusItem
        KeyNavigation.tab: backButton
    }

    FlickableType {
        id: fl
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        contentHeight: content.height

        ColumnLayout {
            id: content

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 16

            BackButtonType {
                id: backButton
                Layout.topMargin: 20
                KeyNavigation.tab: textKey.textField
            }

            HeaderType {
                Layout.fillWidth: true
                Layout.rightMargin: 16
                Layout.leftMargin: 16

                headerText: qsTr("Connection key")
                descriptionText: qsTr("A line that starts with vpn://...")
            }

            TextFieldWithHeaderType {
                id: textKey

                Layout.fillWidth: true
                Layout.topMargin: 32
                Layout.rightMargin: 16
                Layout.leftMargin: 16

                headerText: qsTr("Key")
                textFieldPlaceholderText: "vpn://"
                buttonText: qsTr("Insert")

                clickedFunc: function() {
                    textField.text = ""
                    textField.paste()
                }

                KeyNavigation.tab: continueButton
            }
        }
    }

    BasicButtonType {
        id: continueButton

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.leftMargin: 16
        anchors.bottomMargin: 32

        text: qsTr("Continue")
        Keys.onTabPressed: lastItemTabClicked(focusItem)

        clickedFunc: function() {
            if (ImportController.extractConfigFromData(textKey.textFieldText)) {
                PageController.goToPage(PageEnum.PageSetupWizardViewConfig)
            }
        }
    }
}
