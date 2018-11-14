def seller_to_dict(row):
    return {
        'ssn': row[0],
        'firstname': row[1],
        'lastname': row[2],
        'description': row[3],
        'time_registered': row[4],
        'time_updated': row[5],
        'username': row[6],
        'password_hash': row[7]
    }

def item_to_dict(row):
    return {
        'id': row[0],
        'description': row[1],
        'price': row[2],
        'product_name': row[3],
        'product_brand': row[4],
        'time_updated': row[5],
        'time_created': row[6],
        'supplier': row[7],
        'quantity': row[8],
        'category_id': row[9],
        'seller_ssn': row[10]
    }
