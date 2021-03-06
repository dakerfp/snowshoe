TEMPLATE = app
TARGET = ../snowshoe

QT += declarative sql widgets webkit quick core-private gui-private

SOURCES += \
    main.cpp \
    ApplicationStateTracker.cpp \
    BookmarkModel.cpp \
    BrowserWindow.cpp \
    DatabaseManager.cpp \
    PopupMenu.cpp \
    Shortcut.cpp \
    BookmarkFilter.cpp

HEADERS += \
    ApplicationStateTracker.h \
    BookmarkModel.h \
    BrowserWindow.h \
    DatabaseManager.h \
    PopupMenu.h \
    BookmarkFilter.h \
    Shortcut.h \
    UrlTools.h

RESOURCES += \
    snowshoe.qrc

MOC_DIR = .moc/
RCC_DIR = .rcc/
OBJECTS_DIR = .obj/

OTHER_FILES += \
    qml/main.qml \
    qml/Tab.qml \
    qml/TabWidget.qml \
    qml/TabWidget.js \
    qml/UrlEdit.qml \
    qml/UrlBar.qml \
    qml/PageWidget.qml \
    qml/NewTab.qml \
    qml/BookmarkBar.qml \
    qml/DropDownMenuBookmark.qml \
    qml/BookmarkBarDelegate.qml \
    qml/DropDownMenuBookmarkDelegate.qml \
    qml/Button.qml \
    qml/HoveredLinkBar.qml
