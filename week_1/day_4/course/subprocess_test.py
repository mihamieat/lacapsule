import subprocess

result = subprocess.run(["ls", "file"], capture_output=False, text=True)

if result.returncode == 0:
    subprocess.run(["echo", "La premiere commande a reussi"])
else:
    print("La premiere commande a echoue avec l'erreur: ", result.stderr)