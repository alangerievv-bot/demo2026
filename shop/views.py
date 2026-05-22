from django.shortcuts import render, redirect
from .models import Users, Products, Brands, Types, Units, ProductInOrders
from django.contrib import messages
from django.db.models import Q
# Create your views here.
def login_view(req):
  if req.method == 'POST':
    
    if 'guest' in req.POST:
      req.session.flush()
      return redirect('product_list')
    
    login = req.POST.get('login')
    password = req.POST.get('password')
    
    try:
      user = Users.objects.get(login=login, password=password)
      req.session.flush()
      req.session["user_name"] = f"{user.surname} {user.name} {user.father_name}"
      req.session['user_id'] = user.id
      req.session['role_id'] = user.role_id
      return redirect('product_list')
    except Users.DoesNotExist:
      messages.error(req, 'Неверный логин или пароль')
  return render(req, 'login.html')

def product_list(req):
  role_id = req.session.get('role_id')
  products = Products.objects.all().order_by('id')
  
  if role_id in [1,2,3]:
    search_query = req.GET.get('search', '')
    brand_filter = req.GET.get('brand', '')
    sort = req.GET.get('sort', '')
    
    if search_query:
      products = products.filter(
        Q(name__icontains=search_query) |
        Q(description__icontains=search_query) |
        Q(type__name__icontains=search_query) |
        Q(brand__name__icontains=search_query)
      )
    if brand_filter:
      products = products.filter(brand_id=brand_filter)
      
    if sort == 'asc':
      products = products.order_by('quantity')
    elif sort == 'desc':
      products = products.order_by('-quantity')
  else:
    search_query = ''
    brand_filter = ''
    sort = ''
  brands = Brands.objects.all()
  return render(req, 'product_list.html', {
    "products": products,
    'search_query': search_query,
    'sort': sort,
    'brand_filter': brand_filter,
    'role_id': role_id,
    'brands': brands
    })

def logout_view(req):
  req.session.flush()
  return redirect('login')

def add_product(req):
  if req.session['role_id'] != 1:
    messages.error(req, 'Недостаточно прав')
    return redirect('product_list')
  
  brands = Brands.objects.all()
  types = Types.objects.all()
  units = Units.objects.all()
  
  if req.method == "POST":
    Products.objects.create(
      name=req.POST.get('name'),
      description=req.POST.get('description'),
      unit_id=req.POST.get('unit'),
      brand_id=req.POST.get('brand'),
      type_id=req.POST.get('type'),
      discount=req.POST.get('discount'),
      price=req.POST.get('price'),
      quantity=req.POST.get('quantity'),
    )
    messages.success(req, "Товар успешно добавлен")
    return redirect('product_list')
  return render(req, 'add_product.html', {
    'brands': brands,
    'types': types,
    'units': units
  })

def edit_product(req, product_id):
  if req.session['role_id'] != 1:
    messages.error(req, "недостаточно прав")
    return redirect('product_list')
  product = Products.objects.get(id=product_id)
  
  brands = Brands.objects.all()
  types = Types.objects.all()
  units = Units.objects.all()
  if req.method == "POST":
    product.name=req.POST.get('name')
    product.description=req.POST.get('description')
    product.unit_id=req.POST.get('unit')
    product.brand_id=req.POST.get('brand')
    product.type_id=req.POST.get('type')
    product.discount=req.POST.get('discount')
    product.price=req.POST.get('price')
    product.quantity=req.POST.get('quantity')
    product.save()
    messages.success(req, "Товар успешно добавлен")
    return redirect('product_list')
  
  return render(req, 'edit_product.html', {
    'brands': brands,
    'types': types,
    'units': units,
    'product': product
  })
  
def delete_product(req, product_id):
  if req.session['role_id'] != 1:
    messages.error(req, "недостаточно прав")
    return redirect('product_list')
  product = Products.objects.get(id=product_id)
  
  if ProductInOrders.objects.filter(product=product).exists():
    messages.error(req, 'Нельзя удалить товар, который находится в заказе')
    return redirect('product_list')
  if req.method == 'POST':
    product.delete()
    messages.success(req, "Товар успешно удален")
    return redirect('product_list')
  return render(req, 'delete_product.html', {'product': product})