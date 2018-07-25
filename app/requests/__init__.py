from app import DatabaseManager


def check_request(request_id):
    with DatabaseManager() as cursor:
        """
            Check if request exists
        """
        cursor.execute("SELECT id FROM requests WHERE  id = %s", [request_id])
        exists = cursor.fetchone()
        if not exists:
            return False
        return True


def not_approved(request_id):
    with DatabaseManager() as cursor:
        """
            Check if request is not pending
        """
        cursor.execute("SELECT status FROM requests WHERE  id = %s", [request_id])
        status = cursor.fetchone()

        if status[0] != "Pending":
            return "approved"
        else:
            return "not_approved"
