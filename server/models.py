def row_to_dict(col, row):
    return dict(zip([e[0] for e in col], row))
def rows_to_dict_list(col, rows):
    return [row_to_dict(col, row) for row in rows]
