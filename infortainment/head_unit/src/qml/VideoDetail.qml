import QtQuick 2.11
import QtQuick.Controls 2.4
import QtWebEngine 1.7
import QtQuick.VirtualKeyboard 2.1

Rectangle {

    InputPanel {
        id: inputPanel
        z: 99
        width: parent.width
        anchors.bottom: parent.bottom
        visible: Qt.inputMethod.visible  // Important modification
    }

    Rectangle {
        id: videopage
        width: parent.width
        height: parent.height
        color: "#dfe4ea"

        TextField {
            id: searchField
            width: parent.width - searchButton.width - 100
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 80
            placeholderText: "Search for a YouTube video..."
            focus: true
            onActiveFocusChanged: {
                if (activeFocus) {
                    inputPanel.open(searchField)
                }
            }
        }

        Button {
            id: searchButton
            width: 100
            text: "Search"
            anchors.top: searchField.top
            anchors.left: searchField.right
            anchors.leftMargin: 10
            onClicked: {
                webView.url = "https://www.youtube.com/results?search_query=" + encodeURIComponent(searchField.text);
                searchField.focus = false; // Hide the keyboard when searching
            }
        }

        WebEngineView {
            id: webView
            anchors.top: searchField.bottom
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            url: ""
        }
    }
}
