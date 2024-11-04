"""Locust file package."""
from locust import HttpUser, task

class First_Load_Test(HttpUser):
    """My first load test class."""

    @task
    def first_test(self):
        """First stressing test."""
        self.client.get("/")

