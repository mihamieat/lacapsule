from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
import json
from .utils import write_file, UploadFileForm, savefile

# Create your routes here

def hello_route(request):
    return JsonResponse({"answer": "Hello, world"})

def home(request):
    return JsonResponse({"message": "Welcome to my Django APp"})

def square(request, number):
    answer = number ** 2
    return JsonResponse({"answer": answer})

def concat(request, str1, str2):
    return JsonResponse({"message": str1+str2})

@csrf_exempt
def return_students(request):
    if request.method == "POST":
        body = json.loads(request.body)
        students = [employee for employee in body["employees"] if employee["status"] == "student"]
        return JsonResponse({"sutdents": students})

@csrf_exempt
def write_data(request):
    if request.method == "POST":
        body = json.loads(request.body)
        write_file("./data.txt", body["message"])
        return JsonResponse({"message": "Successfully write to data file."})

@csrf_exempt
def upload(request):
    if request.method == "POST":
        
        form = UploadFileForm(request.POST, request.FILES)
        # return JsonResponse({"file": request.FILES["file"]})
        # if form.is_valid():
        savefile("./newfile", request.FILES["file"])
        return JsonResponse({"message": "File uploaded"})
    else:
        form = UploadFileForm()
    return JsonResponse({"error": "cannot upload file"})
