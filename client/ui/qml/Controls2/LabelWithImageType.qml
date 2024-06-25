import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "TextTypes"

RowLayout {
    property string imageSource
    property string leftText
    property string rightText

    Image {
        Layout.preferredHeight: 18
        Layout.preferredWidth: 18
        source: imageSource
    }

    ListItemTitleType {
        Layout.fillWidth: true
        Layout.rightMargin: 10
        Layout.alignment: Qt.AlignRight

        text: leftText
    }

    ParagraphTextType {
        visible: rightText !== ""

        Layout.alignment: Qt.AlignLeft

        text: rightText
    }
}
