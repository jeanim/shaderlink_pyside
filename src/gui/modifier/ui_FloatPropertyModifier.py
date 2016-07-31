# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui_FloatPropertyModifier.ui'
#
# Created: Sun Jul 31 21:52:25 2016
#      by: pyside-uic 0.2.15 running on PySide 1.2.2
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_FloatPropertyModifier(object):
    def setupUi(self, FloatPropertyModifier):
        FloatPropertyModifier.setObjectName("FloatPropertyModifier")
        FloatPropertyModifier.resize(232, 56)
        FloatPropertyModifier.setMinimumSize(QtCore.QSize(232, 54))
        FloatPropertyModifier.setMaximumSize(QtCore.QSize(232, 56))
        self.verticalLayout_2 = QtGui.QVBoxLayout(FloatPropertyModifier)
        self.verticalLayout_2.setSpacing(0)
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.propGroupBox = QtGui.QGroupBox(FloatPropertyModifier)
        self.propGroupBox.setObjectName("propGroupBox")
        self.verticalLayout = QtGui.QVBoxLayout(self.propGroupBox)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.floatEdit = QtGui.QLineEdit(self.propGroupBox)
        self.floatEdit.setMinimumSize(QtCore.QSize(50, 20))
        self.floatEdit.setMaximumSize(QtCore.QSize(50, 20))
        self.floatEdit.setObjectName("floatEdit")
        self.horizontalLayout.addWidget(self.floatEdit)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.verticalLayout_2.addWidget(self.propGroupBox)

        self.retranslateUi(FloatPropertyModifier)
        QtCore.QMetaObject.connectSlotsByName(FloatPropertyModifier)

    def retranslateUi(self, FloatPropertyModifier):
        FloatPropertyModifier.setWindowTitle(QtGui.QApplication.translate("FloatPropertyModifier", "Form", None, QtGui.QApplication.UnicodeUTF8))
        self.propGroupBox.setTitle(QtGui.QApplication.translate("FloatPropertyModifier", "Float", None, QtGui.QApplication.UnicodeUTF8))

