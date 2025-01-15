# how to add new table to child row

```html}
<table id="example" class="display" width="100%"></table>
<table id="result" class="display" width="100%"></table>
```



~~~js
<script>
 
$(document).ready(function() {
     var table = $('#example').DataTable( {
 
"lengthMenu": [ 3, 10, 50, 75, 100 ],
  "dom": '<"top"Bfpl<"clear">>rt<"bottom"fpl<"clear">>',
        buttons: [
            {
            text: 'Показать',
            extend: 'collection',
            buttons: [ 'columnsToggle' ]
        }
         ],
         "language": { "search": "Поиск:",
                        "lengthMenu": " _MENU_ ",
                        "paginate": {
                        "previous": "Предыдущая",
                        "next": "Следующая"
                        }
                     },
        "data": [
        {
            "id":         "",
            "name":       "Tiger Nixon",
            "position":   "System Architect",
            "salary":     "$3,120",
            "start_date": "2011/04/25",
            "office":     "Edinburgh",
            "extn":       "5421"
        },
        {
            "id":         "2",
            "name": "Garrett Winters",
            "position": "Director",
            "salary": "5300",
            "start_date": "2011/07/25",
            "office": "Edinburgh",
            "extn": "8422"
        },
         ],
 "columns": [
          {
                "className":      'dt-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
        { "data": "id", "title": "id", "visible": false },
        { "data": "name", "title": "name" },
        { "data": "position", "title": "position" },
        { "data": "office" , "title": "office"},
        { "data": "extn" , "title": "extn", "visible": false },
        { "data": "start_date", "title": "start_date", "visible": false },
        { "data": "salary" , "title": "salary"}
    ],
           "order": [[1, 'asc']]  } );
 
function format ( rowData ) {
        ```var div = $('<div/>'); ```
 
          $('#result').DataTable( {
       "lengthMenu": [ 3, 10, 50, 75, 100 ],
        "dom": '<"top"Bfl<"clear">>rt<"bottom"p<"clear">>',
        buttons: [
            {
            text: 'Показать',
            extend: 'collection',
            buttons: [ 'columnsToggle' ]
            }
         ],
         "language": { "search": "Поиск:",
                        "lengthMenu": " _MENU_ ",
                        "paginate": {
                        "previous": "Предыдущая",
                        "next": "Следующая"
                        }
                     },
        "data": [
        {
            "id":         "1",
            "name":       "Tiger Nixon",
            "position":   "System Architect",
            "salary":     "$3,120",
            "start_date": "2011/04/25",
            "office":     "Edinburgh",
            "extn":       "5421"
        },
        {
            "id":         "2",
            "name": "Garrett Winters",
            "position": "Director",
            "salary": "5300",
            "start_date": "2011/07/25",
            "office": "Edinburgh",
            "extn": "8422"
        },  ], 
 "columns": [
         
        { "data": "id", "title": "id", "visible": false },
        { "data": "name", "title": "name" },
        { "data": "position", "title": "position" },
        { "data": "office" , "title": "office"},
        { "data": "extn" , "title": "extn", "visible": false },
        { "data": "start_date", "title": "start_date", "visible": false },
        { "data": "salary" , "title": "salary"}
    ]
         
        } );
    return div;
    };
        $('#example tbody').on('click', 'td.dt-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
  
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } ); } );
 
</script>
~~~

