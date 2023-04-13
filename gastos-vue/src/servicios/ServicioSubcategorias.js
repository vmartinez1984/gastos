import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'subcategorias/'

export default {
    async obtenerTodoAsync() {
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    },

    async agregarAsync(subcategoria) {
        var response

        response = await axios.post(
            url,            
            {
                "categoriaId": subcategoria.categoriaId,
                "nombre": subcategoria.nombre,
                "cantidad": subcategoria.cantidad
            }
        )
        
        console.log(response)

        return response.data
    },

    /**
     * 
     * @param {int} subcategoriaId 
     * @returns apartado[]
     */
    async obtenerApartadosPorSubcategoriaIdAsync(subcategoriaId){
        var response

        response = await axios({
            url: url + subcategoriaId + '/apartados',
            method: 'GET'
        })

        return response.data
    },

    async actualizarAsync(subcategoria){
        var response

        response = await axios.put(
            url+subcategoria.id,
            {
                "categoriaId": subcategoria.categoriaId,
                "nombre": subcategoria.nombre,
                "cantidad": subcategoria.cantidad
            }
        )

        return response.data
    }
}