from setuptools import setup, find_packages

# Read requirements from requirements.txt
with open("requirements.txt") as f:
    required = f.read().splitlines()

setup(
    name="CompLearning",
    version="0.1.0",
    description="Computational Learning course project.",
    author="Mario Pascual Gonzalez, Gonzalo Mesas Aranda",
    author_email="mario.pg02@gmail.com",
    packages=find_packages(),
    install_requires=required,
    python_requires='>=3.10',
)
