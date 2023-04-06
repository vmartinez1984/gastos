import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'periodos/'

export default{
    async obtenerTodos(){
        var response

        response = await axios({
            url: url,
            method:'GET'
        })

        return response.data
    },

    async obtener(id){
        var response

        response = await axios({
            url: url + id + '/gastos' ,
            method:'GET'
        })

        return response.data
    }
}