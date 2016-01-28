import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		List<String> result = new ArrayList<String>();
		Statement st = null;
		ResultSet rs = null;
		//the query is done by putting separate string together then 
		//gets executed using executeQuery. query intersect address_id with mg_customer
		String updateString =
			"select phone from dv_address " +
			"where address_id in " +
			"(select address_id from mg_customers " +
			"where mg_customers.last_name = \'" + lastName +
			"\' and mg_customers.first_name = \'" + firstName +
			"\')";
		try {
			//create statement then execute the query
                	st = connection.createStatement();
			rs = st.executeQuery(updateString);
			while(rs.next())
			{
				//add the string to the result
				result.add(rs.getString(1));
			}
			rs.close();
			st.close();
                } catch (SQLException e) {
			System.out.println("Sorry bro, it done messed up: " + e);
		}
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();
		Statement st = null;
                ResultSet rs = null;
		//the query is done by putting separate string together then
		//gets executed using executeQuery. query is check length of film
                String updateString =
                        "select title from dv_film " +
                        "where length >= " + minLength +
                        " and length <= " + maxLength;
                try {
			//create statement then execute the query
                        st = connection.createStatement();
                        rs = st.executeQuery(updateString);
                        while(rs.next())
                        {
				//add the string to the result
                                result.add(rs.getString(1));
                        }
                        rs.close();
                        st.close();
                } catch (SQLException e) {
                        System.out.println("Sorry bro, it done messed up: " + e);
                }
		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = 0;
		Statement st = null;
                ResultSet rs = null;
		String Status = "";
		 //the query is done by putting separate string together then
		 //gets executed using executeQuery. the result is counting the intersection of address_id
		if (active) { Status = "true"; } else { Status = "false"; }
                String updateString =
                        "select last_name from mg_customers " +
                        "where active = " + Status + " and address_id in " +
                        "(select address_id from dv_address " +
                        "where district = \'" + districtName + "\')";
                try {
			//create statement then execute the query
                        st = connection.createStatement();
                        rs = st.executeQuery(updateString);
                        while(rs.next())
                        {
				//increment the result, we don't need the string
                                ++result;
                        }
                        rs.close();
                        st.close();
                } catch (SQLException e) {
                        System.out.println("Sorry bro, it done messed up: " + e);
                }
		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
		Statement st = null;
		//replace null variables with null string
		if (title == null) title = "null";
		if (description == null) description = "null";
		if (rating == null) rating = "null";
		//insert by updating the database with statement.
                try {
			String updateString =
                        	"insert into dv_film(title, description, length, rating) " +
				"values (\'" + title + "\', \'" + description + "\', " + length + ", \'" + rating + "\' )";
			//execute update to database with corresponding values
			st = connection.createStatement();
			st.executeUpdate(updateString);
			st.close();
                } catch (SQLException e) {
                        System.out.println("Sorry bro, it done messed up: " + e);
		}	
	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
