#importing all of our libraries that we will use to diplay our window and connect with our database
import PySimpleGUI as sg
import mysql.connector
from datetime import date

#setting the current date to add this to the database entries
today = date.today()

#setting up the connection to our internal database
database = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="pass",
    database="bib"
)
databasecursor = database.cursor()

#setting up the different columns for our different books entries

colBook1 = [
    [sg.Text('Book 1 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 1 review :'), sg.InputText()],
]
colBook2 = [
    [sg.Text('Book 2 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 2 review :'), sg.InputText()],
]
colBook3 = [
    [sg.Text('Book 3 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 3 review :'), sg.InputText()],
]
colBook4 = [
    [sg.Text('Book 4 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 4 review :'), sg.InputText()],
]
colBook5 = [
    [sg.Text('Book 5 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 5 review :'), sg.InputText()],
]
colBook6 = [
    [sg.Text('Book 6 ID :'), sg.InputText(size=5), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('Book 6 review :'), sg.InputText()],
]

# All of the different windows that our gui can display.
layout1 = [  [sg.Text('Thank you for returning your books!')],
            [sg.Text('Please enter your user ID here :'), sg.InputText(size=5)],
            [sg.Text('How many books did you bring back?'), sg.Slider(range=(1,6), default_value=1, orientation='h')],
            [sg.Button('Next', key='next')]
        ]

layout2 = [
    [sg.Column(colBook1, key='-Book1-')],
    [sg.Column(colBook2, visible=False, key='-Book2-')],
    [sg.Column(colBook3, visible=False, key='-Book3-')],
    [sg.Column(colBook4, visible=False, key='-Book4-')],
    [sg.Column(colBook5, visible=False, key='-Book5-')],
    [sg.Column(colBook6, visible=False, key='-Book6-')],
    [sg.Button('Submit', key='submit')]
]

layout5 = [
    [sg.Text('Thank you for submitting your review!')]
]

layout = [
    [sg.Column(layout1, key='-COL1-'), sg.Column(layout2, visible=False, key='-COL2-'), sg.Column(layout5, visible=False, key='-COL5-')],
    [sg.Button('Exit', key='Exit')]
]

# Create the Window
window = sg.Window('Boek Review', layout)
# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Exit': # if user closes window or clicks Exit
        break
    if event == 'next' and values[1] <= 6:
        #change layout of window
        window[f'-COL1-'].update(visible=False)
        window[f'-COL2-'].update(visible=True)
        #showing the right amount of book entries for the amount of books being added
        if values[1] > 1:
            i = 2
            while i != (values[1] + 1):
                window['-Book{0}-'.format(i)].update(visible=True)
                i += 1
    if event == 'submit':
        i = 2
        j = 0
        #preparing the sql statement to insert the data into our database
        sql = "INSERT INTO review (star1_5, text, dataOfReview, bookId, customerId) VALUES (%s, %s, %s, %s, %s)"
        #looping until all book entries have been added
        while j < values[1]:
            #setting the correct values for the specific book review
            val = (values[i+1],values[i+2],today,values[i],values[0])
            #executing the sql statement and commiting it to our database
            databasecursor.execute(sql, val)
            database.commit()
            i += 3
            j += 1
        #switching window layout to the exit window
        window[f'-COL2-'].update(visible=False)
        window[f'-COL5-'].update(visible=True)

window.close()