# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Brands(models.Model):
    name = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'brands'


class Categories(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'categories'


class Orders(models.Model):
    order_date = models.DateField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    pickup_point = models.ForeignKey('PickupPoints', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    code = models.IntegerField(blank=True, null=True)
    status = models.ForeignKey('Statuses', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orders'


class PickupPoints(models.Model):
    index = models.IntegerField(blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    street = models.CharField(max_length=255, blank=True, null=True)
    building = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pickup_points'


class ProductCategory(models.Model):
    product = models.ForeignKey('Products', models.DO_NOTHING, blank=True, null=True)
    category = models.ForeignKey(Categories, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product_category'


class ProductInOrders(models.Model):
    order = models.ForeignKey(Orders, models.DO_NOTHING, blank=True, null=True)
    product = models.ForeignKey('Products', models.DO_NOTHING, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product_in_orders'


class Products(models.Model):
    article = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    unit = models.ForeignKey('Units', models.DO_NOTHING, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    brand = models.ForeignKey(Brands, models.DO_NOTHING, blank=True, null=True)
    type = models.ForeignKey('Types', models.DO_NOTHING, blank=True, null=True)
    discount = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    photo = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'products'
    @property
    def final_price(self):
        if self.price and self.discount > 0:
            return round(self.price * (1 - self.discount / 100))
        return self.price
    @property
    def is_available(self):
        return self.quantity > 0

class Roles(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'


class Statuses(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'statuses'


class Types(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'types'


class Units(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'units'


class Users(models.Model):
    role = models.ForeignKey(Roles, models.DO_NOTHING, blank=True, null=True)
    surname = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    father_name = models.CharField(max_length=255, blank=True, null=True)
    login = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
