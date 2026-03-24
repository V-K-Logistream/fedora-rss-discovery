import shutil
import sys

def check_engine_requirements():
    """
    Verifies if the necessary Linux binaries are present in the system PATH.
    """
    # Define the core 'engine' parts needed for RSS discovery
    requirements = ["curl", "grep"]
    missing = []

    for tool in requirements:
        if shutil.which(tool) is None:
            missing.append(tool)

    # Output results to the user
    if not missing:
        print("RESULT: (a) Requirements met. Your engine is ready.")
        sys.exit(0)
    else:
        print(f"RESULT: (b) Requirements failed. Missing packages: {', '.join(missing)}")
        print("Please run: sudo dnf install " + " ".join(missing))
        sys.exit(1)

if __name__ == "__main__":
    check_engine_requirements()
