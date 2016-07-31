# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui_StringPropertyModifier.ui'
#
# Created: Sun Jul 31 21:53:12 2016
#      by: pyside-uic 0.2.15 running on PySide 1.2.2
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_StringPropertyModifier(object):
    def setupUi(self, StringPropertyModifier):
        StringPropertyModifier.setObjectName("StringPropertyModifier")
        StringPropertyModifier.resize(232, 54)
        StringPropertyModifier.setMinimumSize(QtCore.QSize(232, 54))
        StringPropertyModifier.setMaximumSize(QtCore.QSize(232, 54))
        self.vboxlayout = QtGui.QVBoxLayout(StringPropertyModifier)
        self.vboxlayout.setSpacing(0)
        self.vboxlayout.setContentsMargins(0, 0, 0, 0)
        self.vboxlayout.setObjectName("vboxlayout")
        self.propGroupBox = QtGui.QGroupBox(StringPropertyModifier)
        self.propGroupBox.setObjectName("propGroupBox")
        self.vboxlayout1 = QtGui.QVBoxLayout(self.propGroupBox)
        self.vboxlayout1.setObjectName("vboxlayout1")
        self.stringEdit = QtGui.QLineEdit(self.propGroupBox)
        self.stringEdit.setObjectName("stringEdit")
        self.vboxlayout1.addWidget(self.stringEdit)
        self.vboxlayout.addWidget(self.propGroupBox)

        self.retranslateUi(StringPropertyModifier)
        QtCore.QMetaObject.connectSlotsByName(StringPropertyModifier)

    def retranslateUi(self, StringPropertyModifier):
        StringPropertyModifier.setWindowTitle(QtGui.QApplication.translate("StringPropertyModifier", "Form", None, QtGui.QApplication.UnicodeUTF8))
        self.propGroupBox.setTitle(QtGui.QApplication.translate("StringPropertyModifier", "String", None, QtGui.QApplication.UnicodeUTF8))

