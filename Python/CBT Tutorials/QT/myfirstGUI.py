import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv)

w = QtGui.QWidget()
w.resize(250,150)
w.move(300,300)
w.setWindowTitle('My First GUI App!')
w.show()

status = app.exec_()
sys.exit(status)
