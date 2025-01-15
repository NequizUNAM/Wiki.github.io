Index

```js
<!-- Script Button -->
<script id="tplButtonReturn" type="text/x-jsrender">
  <a class="text-dark btn-flotante-return btnReturnPage" data-name_menu="{{:}}"><i class="fas fa-home"></i> regresar </a>
</script>
```



```js
<script id="tplResponsables" type="text/x-jsrender">
    <input type="hidden" data-idkeyform="{{:key}}" data-target="idUsuarioResponsable" value="{{:ID_USUARIO_RESPONSABLE}}">
    <input type="hidden" data-idkeyform="{{:key}}" data-target="idGrupoResponsable" value="{{:ID_GRUPO_USUARIOS_RESPONSABLES}}">

    <div class="form-group col-md-6">
        <label class="text-dark" for="inputResponsableNombre">Nombre Responsable</label>
        <input type="text" maxlength="40" class="form-control border border-dark" placeholder="Nombre" value="{{:NOMBRE_RESPONSABLE}} {{:APELLIDO_PATERNO_RESPONSABLE}} {{:APELLIDO_MATERNO_RESPONSABLE}}" disabled>
    </div>
    <div class="form-group col-md-6">
    </div>
</script>
```



```js
<script id="tplDocumentosDownload" type="text/x-jsrender">
{{if ID_DOCUMENTO_CONTRALORIA}}
  <div class="col-sm-3 shadow rounded border mx-4 my-2" data-target="{{:ID_DOCUMENTO_CONTRALORIA}}">
      <div class="text-center pt-1">
          <i class="fas fa-file-pdf icon-big"></i>
          <!-- <p> Doc {{:#getIndex()+1}}  </p> -->
          <p> {{:NOMBRE_DOCUMENTO}} </p>

      </div>
      <div class="input-group mb-3 justify-content-around">
          <a class="btn btn-outline-primary btn-sm" href="{{fnRouteFiles:RUTA_ARCHIVO}}" download><i class="fas fa-download"></i></a>
          <button class="btn btn-outline-danger btn-sm btnDeleteFileExpediente" data-id_documento_contraloria="{{:ID_DOCUMENTO_CONTRALORIA}}" data-id_grupo_documento="{{:ID_GRUPO_DOCUMENTOS}}"><i type="button" class="fas fa-trash-alt"></i></button>
      </div>  
  </div>
  {{else}}
    No hay documentos disponibles
{{/if}}
</script>
```

