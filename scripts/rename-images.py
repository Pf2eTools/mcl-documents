import os

DIR = "../assets/loyalist-targ"


def main():
    files = os.listdir(DIR)
    for file in files:
        if not file.endswith("b.jpg"):
            continue
        if file.replace(".jpg", "b.jpg") in files:
            continue
        os.rename(os.path.join(DIR, file), os.path.join(DIR, file.replace("b.jpg", "_b.jpg")))


if __name__ == "__main__":
    main()
