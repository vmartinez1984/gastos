import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'periodos/'

export default {
    async obtenerTodos() {
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    },

    async obtener(id) {
        var response

        response = await axios({
            url: url + id + '/gastos',
            method: 'GET'
        })

        return response.data
    },

    async agregarAsync(periodo) {
        var response

        response = await axios.post(url, {
            "nombre": periodo.nombre,
            "fechaInicial": periodo.fechaInicial,
            "fechaFinal": periodo.fechaFinal,
            "guid": periodo.guid
        })

        return response.data
    },

    async borrarAsync(id) {
        var response

        response = await axios({
            url: url + id,
            method: 'DELETE'
        })

        return response.data
    },

    async actualizarAsync(periodo) {
        var response

        response = await axios.put(url + periodo.guid, {
            "nombre": periodo.nombre,
            "fechaInicial": periodo.fechaInicial,
            "fechaFinal": periodo.fechaFinal,
            "guid": periodo.guid
        })

        return response.data
    }
}