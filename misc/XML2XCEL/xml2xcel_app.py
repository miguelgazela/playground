#!/usr/bin/env python

from Tkinter import *
from ttk import Style


class Xml2Xcel(Frame):
  
    def __init__(self, parent):
        Frame.__init__(self, parent, background="white")   
        self.parent = parent
        self.init_UI()
    
    def init_UI(self):
        self.parent.title("XML to Excel")
        self.style = Style()
        self.style.theme_use("default")

        frame = Frame(self, relief=RAISED, borderwidth=1)
        frame.pack(fill=BOTH, expand=1)

        self.pack(fill=BOTH, expand=1)

        closeButton = Button(self, text="Close")
        closeButton.pack(side=RIGHT, padx=5, pady=5)
        okButton = Button(self, text="Create Excel file")
        okButton.pack(side=RIGHT)

        self.center_window()
        
    def center_window(self):
        w = 290
        h = 150

        sw = self.parent.winfo_screenwidth()
        sh = self.parent.winfo_screenheight()
        
        x = (sw - w)/2
        y = (sh - h)/2
        self.parent.geometry('%dx%d+%d+%d' % (w, h, x, y))


def main():
  
    root = Tk()
    app = Xml2Xcel(root)
    root.mainloop()  


if __name__ == '__main__':
    main() 