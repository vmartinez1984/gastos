<template>
    <div class="card">
        <div class="card-header">
            <h3>Agregar nuevo</h3>
        </div>

        <div class="card-body">
            <form @submit.prevent="guardarSubcategoriaAsync">
                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Categoria</label>
                    </div>
                    <div class="col-10">
                        <select class="form-select" v-model="subcategoria.categoriaId">
                            <option value="0">Seleccione</option>
                            <option v-for="categoria in categorias" :key="categoria.id" :value="categoria.id" >{{ categoria.nombre }}</option>
                        </select>                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="subcategoria.nombre" class="form-control" placeholder="Vacaciones"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">$</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="subcategoria.cantidad" class="form-control" placeholder="300.00"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-10">
                        <button class="btn btn-primary">
                            Guardar
                        </button>
                    </div>                    
                </div>
            </form>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue'
import servicioCategorias from '@/servicios/ServicioCategorias';
import ServicioSubcategorias from '@/servicios/ServicioSubcategorias';
import router from '@/router';

var subcategoria = ref({
    id: 0,
    nombre: '',
    categoriaId: 0,
    cantidad: 0
})
var categorias= ref({})

const obtenerCategoriasAsync = async () =>{
    categorias.value = await servicioCategorias.obtenerAsync();
    console.log(categorias.value)
}

const guardarSubcategoriaAsync = async () =>{
    //console.log(subcategoria.value)
    ServicioSubcategorias.agregarAsync(subcategoria.value)
    router.push({name: 'listaDeSubcategorias'})
}

onMounted( ()=>{
   obtenerCategoriasAsync();
})
</script>