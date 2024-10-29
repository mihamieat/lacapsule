"""Utilities"""
from django import forms


def write_file(path, data):
    """Write data string in a file."""
    with open(path, 'a') as file:
        file.write(f"{data}\n")

def savefile(path, file):
    with open(path, "wb+") as destibation:
        for chunck in file.chunks():
            destibation.write(chunck)

class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50)
    file = forms.FileField()
