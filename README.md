# Automation Scripts

## [auto-commit-push.sh](./scripts/auto-commit-push.sh)

This script automates the process of committing and pushing changes to a Git repository. It can be scheduled to run at regular intervals using a cron job.

### Usage

1. **Set the working directory:**
   Modify the `WORKING_DIR` variable in the script to the path of your repository.
   ```bash
   WORKING_DIR="$HOME/Temp/Auto-Commit-and-push/"
   ```

2. **Enable or disable logging:**
   If you do not want logging, set the `LOGGING_ENABLED` variable to `false`.
   ```bash
   LOGGING_ENABLED=true # Set to false to disable logging
   ```

3. **Run the script:**
   You can run the script manually or schedule it using a cron job.

## [add-cron-job.sh](./scripts/add-cron-job.sh)

This script helps you add a new cron job to your crontab. It prompts for the schedule and the script path, validates the inputs, and adds the cron job.

### Usage

1. **Run the script:**
   ```bash
   ./add_cron_job.sh
   ```

2. **Follow the prompts:**
   - Enter the time values for when you want the script to run.
   - Enter the full path of the script you want to schedule.

3. **Validation:**
   The script will validate the inputs and check if the specified script exists and is executable.

4. **Cron Job Creation:**
   The script will add the cron job to your crontab and display the added job.

### Example

To schedule a script to run every day at midnight, you would enter the following values when prompted:
- Minute: `0`
- Hour: `0`
- Day of the month: `*`
- Month: `*`
- Day of the week: `*`
- Script path: `/path/to/your/script.sh`

---

> [!NOTE]  
> Before running the `add-cron-job.sh` script, ensure it is executable. If it is not, you can make it executable with the following command:
```bash
chmod +x add-cron-job.sh
```
