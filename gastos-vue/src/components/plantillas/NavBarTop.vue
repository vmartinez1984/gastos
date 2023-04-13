<template>
    <nav class="navbar navbar-expand-lg bg-body-tertiary mb-5">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">                        
                        <router-link to="/periodos" class="nav-link">Periodos</router-link>
                    </li>
                    <li class="nav-item">                        
                        <router-link to="/subcategorias" class="nav-link">Subcategorias</router-link>
                    </li>
                    <li class="nav-item">                        
                        <router-link to="/apartados" class="nav-link">Apartados</router-link>
                    </li>                   
                </ul>
            </div>
        </div>
    </nav>
</template>