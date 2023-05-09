<template>
    <div class="card">
        <div class="card-header">
            <h3>Agregar gasto</h3>
        </div>
        <div class="card-body">
            <form @submit.prevent="guardarAsync">
                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Subcategoria</label>
                    </div>
                    <div class="col-10">
                        <span v-if="estaCargandoSubcategoria">
                            <div class="spinner-border spinner-border-sm text-info" role="status">
                                <span class="visually-hidden">Cargando...</span>
                            </div>
                        </span>
                        <select v-else class="form-select" v-model="gasto.subcategoriaId"
                            :disabled="deshabilitarFormulario">
                            <option value="0">Seleccione</option>
                            <option v-for="subcategoria in subcategorias" :key="subcategoria.id" :value="subcategoria.id">
                                {{ subcategoria.nombre }}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="gasto.nombre" class="form-control" :disabled="deshabilitarFormulario" />
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Presupuesto</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="gasto.presupuesto" class="form-control" disabled />
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">$</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="gasto.cantidad" class="form-control"
                            :disabled="deshabilitarFormulario" />
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-2">
                        <router-link :to="{ name: 'periodoDetalles', params: { 'id': route.query.periodoId } }">
                            Regresar
                        </router-link>
                    </div>
                    <div class="col-10">
                        <button class="btn btn-primary" :disabled="estaCargando">
                            Guardar
                            <span v-if="estaCargando">
                                <div class="spinner-border spinner-border-sm text-info" role="status">
                                    <span class="visually-hidden">Cargando...</span>
                                </div>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'
import servicioGastos from '@/servicios/ServicioGastos'
import router from '@/router';

var route = useRoute()
var subcategorias = ref([])
var gasto = ref({
    nombre: '',
    cantidad: undefined,
    periodoId: undefined,
    idemPotency: '',
    subcategoriaId: 0
})
var estaCargando = ref(false)
var estaCargandoSubcategoria = ref(false)
var deshabilitarFormulario = ref(false)

const guardarAsync = async () => {
    try {
        estaCargando.value = true
        deshabilitarFormulario = true
        //console.log(gasto.value)
        if (gasto.value.id == 0) {
            await servicioGastos.agregarAsync(gasto.value)
        } else {
            await servicioGastos.actualizarAsync(gasto.value)
        }
        router.push({ name: 'periodoDetalles', params: { 'id': route.query.periodoId } })
    } catch (exeption) {
        alert('Valio pepino')
        console.log(exeption)
    } finally {
        estaCargando.value = false
        deshabilitarFormulario = false
    }
}

const uuidv4 = () => {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
        .replace(/[xy]/g, function (c) {
            const r = Math.random() * 16 | 0,
                v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
}

const obtenerSubcategoriasAsync = async () => {
    try {
        estaCargandoSubcategoria.value = true
        subcategorias.value = await servicioSubcategorias.obtenerTodoAsync()
        subcategorias.value.forEach(item => {
            if (item.id == route.query.subcategoriaId) {
                gasto.value.presupuesto = item.cantidad
            }
        })
    } catch (error) {
        console.log(error)
    } finally {
        estaCargandoSubcategoria.value = false
    }
}

onMounted(async () => {
    console.log(route.query)
    console.log(route.name)
    await obtenerSubcategoriasAsync();
    switch (route.name) {
        case 'editarGasto':
            gasto.value.id = route.params.id
            gasto.value.cantidad = route.query.cantidad
            gasto.value.nombre = route.query.nombre
            gasto.value.subcategoriaId = route.query.subcategoriaId
            gasto.value.periodoId = route.query.periodoId
            break

        case 'agregarGasto':
            gasto.value.id = 0
            gasto.value.periodoId = route.query.periodoId
            gasto.value.subcategoriaId = route.query.subcategoriaId
            gasto.value.idemPotency = uuidv4()
            break
        default:
            break;
    }
})
</script>