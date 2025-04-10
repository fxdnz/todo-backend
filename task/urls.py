from django.urls import path
from .views import task_list, create_task, task_detail, SecureHelloView

urlpatterns = [
    path('tasks/', task_list, name='task-list'),
    path('tasks/create/', create_task, name='create-task'),
    path('tasks/<int:pk>/', task_detail, name='task_detail'),
    path('secure-hello/', SecureHelloView.as_view()),
]
