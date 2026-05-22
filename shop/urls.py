from . import views
from django.urls import path, include

urlpatterns = [
    path('', views.login_view, name='login'),
    path('products/', views.product_list, name='product_list'),
    path('logout/', views.logout_view, name='logout'),
    path('add_product/', views.add_product, name='add_product'),
    path('products/edit/<int:product_id>/', views.edit_product, name='edit_product'),
    path('products/delete/<int:product_id>/', views.delete_product, name='delete_product')
]