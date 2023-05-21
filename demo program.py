import PySimpleGUI as sg


layout2 = [
    [sg.Checkbox("Harry potter and the philosopher's stone", default=True)],
    [sg.Checkbox('To kill a Mockingbird')],
    [sg.Checkbox('1984')],
    [sg.Checkbox('The Hitchhikers Guide to the Galaxy')],
    [sg.Checkbox('The great Gatsby', default=True)],
    [sg.Checkbox('Pride and Prejudice')],
    [sg.Checkbox('The Catcher in the Rye')],
    [sg.Checkbox('Brave New World')],
    [sg.Checkbox('The Lord of the Rings', default=True)],
    [sg.Checkbox('The Hunger Games')],
    [sg.Checkbox('One Hundred Years of Solitude')],
    [sg.Button('Next', key='next')]
]

layout3 = [
    [sg.Text("Harry potter and the philosopher's stone :"), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('review :'), sg.InputText()],
    [sg.Text('The great Gatsby :'), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('review :'), sg.InputText()],
    [sg.Text('The Lord of the Rings :'), sg.Text('Stars :'), sg.Slider(range=(1,5), default_value=1, orientation='h')],
    [sg.Text('review :'), sg.InputText()],
    [sg.Button('Submit', key='submit')]
]

layout5 = [
    [sg.Text('Thank you for submitting your review!')]
]

layout = [
    [sg.Column(layout2, key='-COL2-'), sg.Column(layout3, visible=False, key='-COL3-'), sg.Column(layout5, visible=False, key='-COL5-')],
    [sg.Button('Exit', key='Exit')]
]

window = sg.Window('Demo', layout)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Exit': # if user closes window or clicks Exit
        break
    if event == 'next':
        window[f'-COL2-'].update(visible=False)
        window[f'-COL3-'].update(visible=True)
    if event == 'submit':
        window[f'-COL3-'].update(visible=False)
        window[f'-COL5-'].update(visible=True)