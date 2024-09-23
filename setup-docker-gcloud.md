
# Setup Docker and GCloud to Push Docker Images to Google Cloud Container Registry

---

## 1. Install Docker

- **Download and Install Docker:**
  - Visit [Docker's official site](https://www.docker.com/get-started) and follow the installation instructions for your operating system.
- **Verify Docker Installation:**
  
  ```bash
  docker --version
  ```

---
> [!WARNING]  
> If you run docker with sudo, you also need to auth as root. Or docker won't be able to get your credentials!

## 2. Run Docker Without `sudo`

To allow your user to run Docker commands without needing `sudo`. 

### a. Create the Docker Group (if it doesn’t exist)

```bash
sudo groupadd docker
```

### b. Add Your User to the Docker Group

```bash
sudo usermod -aG docker $USER
```

### c. Log Out and Log Back In

Log out of your current session and log back in for the group membership changes to take effect.

### d. Verify Docker Can Run Without `sudo`

```bash
docker run hello-world
```

If successful, Docker is configured to run without `sudo`.

---

## 3. Install Google Cloud SDK

- **Download and Install Google Cloud SDK:**
  - Visit [Google Cloud SDK's official site](https://cloud.google.com/sdk/docs/install) and follow the installation instructions for your operating system.
- **Verify the SDK Installation:**

  ```bash
  gcloud --version
  ```

---

## 4. Initialize Google Cloud SDK

- **Initialize the SDK:**

  ```bash
  gcloud init
  ```

- **Follow the Prompts to:**
  - Log in to your Google account.
  - Select your Google Cloud project.
  - Set the default region and zone.

---

## 5. Enable the Container Registry API

- **Enable the API for Your Project:**

  ```bash
  gcloud services enable containerregistry.googleapis.com
  ```

---

## 6. Authenticate Docker to Google Cloud

- **Configure Docker to Use gcloud as a Credential Helper:**

  ```bash
  gcloud auth configure-docker
  ```

---

## 7. Build Your Docker Image

- **Build Your Docker Image as Usual:**

  ```bash
  docker build -t my-image .
  ```

---

## 8. Tag Your Docker Image for GCR

- **Tag the Image with a GCR Registry Name:**

  ```bash
  docker tag my-image gcr.io/your-project-id/my-image:latest
  ```

  Replace `your-project-id` with your actual Google Cloud project ID, and `my-image:latest` with your image name and desired tag.

---

## 9. Push the Docker Image to GCR

- **Push the Tagged Image to GCR:**

  ```bash
  docker push gcr.io/your-project-id/my-image:latest
  ```

---

## 10. Verify the Image in GCR

- **List Images in Your Project’s GCR:**

  ```bash
  gcloud container images list
  ```

- **View Image Details:**

  ```bash
  gcloud container images list-tags gcr.io/your-project-id/my-image
  ```

---

## Troubleshooting

### If You Encounter Permission Issues Running Docker Without `sudo`:

1. **Ensure Your User Is in the Docker Group:**

   ```bash
   groups $USER
   ```

   You should see `docker` listed among the groups.

2. **Restart the Docker Service:**

   ```bash
   sudo systemctl restart docker
   ```

3. **Reboot Your System (if necessary):**
   - Sometimes a full system reboot is required for the changes to take effect.
