create function modules()
    returns table
            (
                id   int8,
                path cstring
            )
    volatile
    language c
as
'MODULE_PATHNAME';

create view modules as
    (
    select
        id,
        path::text
    from
        modules());

create function hooks()
    returns table
            (
                hook cstring,
                name cstring,
                module_id int8,
                pos  int
            )
    volatile
    language c
as
'MODULE_PATHNAME';

create view hooks as
    (
    select
        hook::text,
        name::text,
        module_id,
        pos
    from
        hooks());