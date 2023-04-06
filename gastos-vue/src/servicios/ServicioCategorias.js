import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'categorias/'

export default{
    async obtenerAsync(){
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    }
}