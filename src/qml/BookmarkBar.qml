/****************************************************************************
 *   Copyright (C) 2011  Instituto Nokia de Tecnologia (INdT)               *
 *                                                                          *
 *   This file may be used under the terms of the GNU Lesser                *
 *   General Public License version 2.1 as published by the Free Software   *
 *   Foundation and appearing in the file LICENSE.LGPL included in the      *
 *   packaging of this file.  Please review the following information to    *
 *   ensure the GNU Lesser General Public License version 2.1 requirements  *
 *   will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.   *
 *                                                                          *
 *   This program is distributed in the hope that it will be useful,        *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of         *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 ****************************************************************************/

import QtQuick 2.0
import Snowshoe 1.0

Item {

    Image {
        anchors.fill: parent
        fillMode: Image.TileHorizontally
        source: "qrc:///bookmark/header_bg"
    }

    ListView {
        id: listView
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: separator.left
            leftMargin: 8
        }
        interactive: false
        orientation: ListView.Horizontal
        property int maximumBookmarkWidth: 150

        BookmarkFilter {
            id: filteredModel
            sourceModel: BookmarkModel
            endRow: Math.floor(listView.width / (listView.maximumBookmarkWidth + listView.spacing)) - 1
        }

        model: filteredModel
        spacing: 8
        delegate: BookmarkBarDelegate {}
    }

    Image {
        id: separator
        anchors {
            top: parent.top
            right: dropDownMenuButton.left
            rightMargin: 10
        }
        source: "qrc:///bookmark/bookmark_header_divisor"
        visible: dropDownMenuButton.visible
    }

    Image {
        id: dropDownMenuButton
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
            topMargin: 8
        }
        source: { dropDownMenuMouseArea.isHovered ? "qrc:///bookmarks/btn_dropdown_menu_over" : "qrc:///bookmarks/btn_dropdown_menu_static"}
        visible: { (filteredModel.endRow != -1 && filteredModel.endRow < BookmarkModel.count - 1) }
        MouseArea {
            id: dropDownMenuMouseArea
            anchors.fill: parent
            hoverEnabled: true
            property bool isHovered: false
            onEntered: { isHovered = true; }
            onExited: { isHovered = false }
            onClicked: {
                PopupMenu.setContextProperty("PageWidget", root);
                PopupMenu.setContextProperty("BookmarkModel", BookmarkModel);
                PopupMenu.setContextProperty("StartRow", filteredModel.endRow + 1);
                PopupMenu.qmlComponent = "DropDownMenuBookmark";
                var point = mapToItem(tabWidget, x, height);
                var globalPos = BrowserWindow.mapToGlobal(dropDownMenuButton.x + dropDownMenuButton.width, point.y);
                PopupMenu.showAtPosition(globalPos.x, globalPos.y);
            }
        }
    }
}
