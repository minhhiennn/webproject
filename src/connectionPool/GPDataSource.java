package connectionPool;

import java.sql.Connection;

public class GPDataSource {
	private static final GPConnectionPool gpPool = new GPConnectionPoolImpl(DbConfiguration.DB_MAX_CONNECTIONS);
	 
    private GPDataSource() {
        super();
    }
 
    public static Connection getConnection() {
        Connection connection = gpPool.getConnection();
        System.out.println("GPPool status: " + gpPool);
        return connection;
    }
 
    public static boolean releaseConnection(Connection connection) {
        return gpPool.releaseConnection(connection);
    }
}
