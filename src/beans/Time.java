package beans;

public class Time implements Runnable {
	private int time = 60;
	private Thread thread = new Thread(this);
	private boolean status = true;

	@Override
	public void run() {
		// TODO Auto-generated method stub
		while (time > 0) {
			try {
				Thread.sleep(1000);
				time = time - 1;
				if (time == 0) {
					status = false;
				}
			} catch (InterruptedException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

	}

	public Time() {
		thread.start();
	}

	public boolean isStatus() {
		return status;
	}

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}
}
