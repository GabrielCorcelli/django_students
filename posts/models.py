from django.db import models


class Estudante(models.Model):
    nome = models.CharField(max_length=30)
    sobrenome = models.CharField(max_length=30)

#teste