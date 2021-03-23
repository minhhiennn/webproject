package connectionPool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

public class GPConnectionPoolImpl implements GPConnectionPool {
	private static final LinkedList<Connection> availableConnections = new LinkedList<>();
	private int maxConnection;

	public GPConnectionPoolImpl(int maxConnection) {
		this.maxConnection = maxConnection;
		initializeConnectionPool();
	}

	private synchronized void initializeConnectionPool() {
		while (!checkIfConnectionPoolIsFull()) {
			Connection newConnection = ConnectionUtils.openConnection();
			availableConnections.add(newConnection);
		}
		notifyAll();
	}

	private boolean checkIfConnectionPoolIsFull() {
		return availableConnections.size() >= maxConnection;
	}

	@Override
	 public synchronized Connection getConnection() {
        while(availableConnections.size() == 0) {
            // Wait for an existing connection to be freed up.
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        // Retrieves and removes the first element of this list
        return availableConnections.poll();
    }
 

	@Override
	public synchronized boolean releaseConnection(Connection connection) {
        try {
            if (connection.isClosed()) {
                initializeConnectionPool();
            } else {
                // Adds the specified element as the last element of this list
                boolean isReleased = availableConnections.offer(connection);
                // Wake up threads that are waiting for a connection
                notifyAll();
                return isReleased;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	public synchronized String toString() {
        StringBuilder sb = new StringBuilder()
                .append("Max=" + DbConfiguration.DB_MAX_CONNECTIONS)
                .append(" | Available=" + availableConnections.size())
                .append(" | Busy=" + (DbConfiguration.DB_MAX_CONNECTIONS - availableConnections.size()))
                ;
        return sb.toString();
    }
}
