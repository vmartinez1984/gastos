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
                        <select class="form-select" v-model="gasto.subcategoriaId">
                            <option value="0">Seleccione</option>
                            <option v-for="subcategoria in subcategorias" :key="subcategoria.id" :value="subcategoria.id">
                                {{ subcategoria.nombre }}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="gasto.nombre" class="form-control" placeholder="Vacaciones" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Presupuesto</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="gasto.presupuesto" class="form-control" disabled />
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">$</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="gasto.cantidad" class="form-control"
                            placeholder="300.00" />
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

const guardarAsync = async () => {    
    //console.log(gasto.value)
    await servicioGastos.agregarAsync(gasto.value)
    router.push({name: 'periodoDetalles',params:{ 'id': route.query.periodoId} })
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
    subcategorias.value = await servicioSubcategorias.obtenerTodoAsync()
    subcategorias.value.forEach(item => {
        if (item.id == route.query.subcategoriaId) {
            gasto.value.presupuesto = item.cantidad
        }
    })
}

onMounted(async () => {
    await obtenerSubcategoriasAsync();
    console.log(route.query)
    gasto.value.periodoId = route.query.periodoId
    gasto.value.subcategoriaId = route.query.subcategoriaId
    gasto.value.idemPotency = uuidv4()
})
</script>