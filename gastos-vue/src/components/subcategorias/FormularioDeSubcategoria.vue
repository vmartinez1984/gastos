<template>
    <div class="card">
        <div class="card-header">
            <h3 :class="titulo.class">{{ titulo.texto }}</h3>
        </div>

        <div class="card-body">
            <form @submit.prevent="guardarSubcategoriaAsync">
                <div class="row m-1">
                    <div class="col-2">
                        <label class="form-label">Categoria</label>
                    </div>
                    <div class="col-10">
                        <select class="form-select" v-model="subcategoria.categoriaId" :disabled="borrado">
                            <option value="0">Seleccione</option>
                            <option v-for="categoria in categorias" :key="categoria.id" :value="categoria.id">{{
                                categoria.nombre }}</option>
                        </select>
                    </div>
                </div>

                <div class="row m-1">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="subcategoria.nombre" class="form-control" placeholder="Vacaciones"
                            :disabled="borrado" />
                    </div>
                </div>

                <div class="row m-1">
                    <div class="col-2">
                        <label class="form-label">$</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="subcategoria.cantidad" class="form-control"
                            placeholder="300.00" :disabled="borrado" />
                    </div>
                </div>
                <div class="row m-1">
                    <div class="col-2"></div>
                    <div class="col-10">
                        <div v-if="borrado">
                            <button class="btn btn-danger text-white">
                                Borrar
                            </button>
                        </div>
                        <div v-else>
                            <button class="btn btn-primary">
                                Guardar
                            </button>
                        </div>
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
import { useRoute } from 'vue-router'

var subcategoria = ref({
    id: 0,
    nombre: '',
    categoriaId: 0,
    cantidad: 0
})
var categorias = ref({})
var borrado = ref(false)
var titulo = ref({
    texto: '',
    class: ''
})
const obtenerCategoriasAsync = async () => {
    categorias.value = await servicioCategorias.obtenerAsync();
    console.log(categorias.value)
}

const guardarSubcategoriaAsync = async () => {
    //console.log(subcategoria.value)
    if (borrado.value) {
        await ServicioSubcategorias.borrarAsync(subcategoria.value.id)
    } else
        if (subcategoria.value.id == 0) {
            await ServicioSubcategorias.agregarAsync(subcategoria.value)
        } else {
            await ServicioSubcategorias.actualizarAsync(subcategoria.value)
        }
    router.push({ name: 'listaDeSubcategorias' })
}

onMounted(() => {
    //console.log(useRoute().query)
    console.log(useRoute().name)
    obtenerCategoriasAsync();
    switch (useRoute().name) {
        case 'agregarSubcategoria':
            titulo.value.texto = "Agregar subcategoria"
            titulo.value.class = "text-primary"
            break
        case 'editarSubcategoria':
            subcategoria.value.id = useRoute().params.id
            subcategoria.value.categoriaId = useRoute().query.categoriaId
            subcategoria.value.nombre = useRoute().query.nombre
            subcategoria.value.cantidad = useRoute().query.cantidad
            subcategoria.value.guid = useRoute().query.guid
            titulo.value.texto = "Editar subcategoria"
            titulo.value.class = "text-warning"
            //console.log(subcategoria.value)
            break
        case 'borrarSubcategoria':
            subcategoria.value.id = useRoute().params.id
            subcategoria.value.categoriaId = useRoute().query.categoriaId
            subcategoria.value.nombre = useRoute().query.nombre
            subcategoria.value.cantidad = useRoute().query.cantidad
            subcategoria.value.guid = useRoute().query.guid
            titulo.value.texto = "¿Desea borrar la subcategoria?"
            titulo.value.class = "text-danger"
            borrado.value = true
            break
    }
})
</script>