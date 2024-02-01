<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#Reference">Reference</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<div align="justify"> This research presents an innovative Lyapunov-based methodology for the dynamic formation control of Autonomous Underwater Vehicles (AUVs) while simultaneously tracking reference trajectories within a nonlinear dynamical system framework. The research commences by establishing the mathematical equations governing the AUV system. Subsequently, meticulously designed reference trajectories are generated for the leader AUV. To enable the leader robot to closely follow these trajectories, a feedback kinematic controller is introduced, ensuring asymptotic convergence. Further, a dynamic control law is devised to compute the requisite actuator torques for the leader AUV, facilitating effective maneuvering. A schematic of the block diagram of our design is depicted below. </div>

![comgit](https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/blob/main/Block%20Diagram.jpg)

<div align="justify"> The investigation extends to the coordination of a group of AUVs through a formation control procedure. This procedure guarantees that the follower AUVs maintain a desired spatial configuration relative to the leader AUV while concurrently tracking the established reference trajectories. The stability analysis of the proposed method encompasses considerations for kinematic, dynamic, and formation controllers, employing the Lyapunov theory. The robustness and efficacy of the developed formation control algorithm are substantiated through a series of comprehensive case studies. These studies involve diverse formations, accounting for parametric uncertainties and external disturbances, providing conclusive evidence of the algorithm's effectiveness in tracking reference trajectories under varying conditions. </div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

In order to apply the codes, you may need to follow the steps below:


<!-- PREREQUISITES -->
### Prerequisites

<div align="justify"> You need to install MATLAB and Simulink Version 2017a or newer ones. If you are using an older version of MATLAB, please let me know at rasoul.zahedifar75@gmail.com to provide you with a save as compatible to your version. </div>



<!-- INSTALLATION -->
### Installation

<div align="justify"> You need to run the file "runner_simulation" in each case study. Please notice that the controller gains could be chosen in this file too. </div>


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

<div align="justify"> The old project is the version before the reviosion and the rest are after revision as the final versions. You can find different scenarios as they are named accordingly, based on the number of the follower AUVs. You can find out about these scenarios as they are expressed completely in the paper of this research, titled same as this repository's title. </div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

<div align="justify"> Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request </div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Ali Keymasi Khalaji - keymasi@khu.ac.ir,
Rasoul Zahedifar - rasoul.zahedifar75@gmail.com

Github Link: [https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots](https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/tree/main)

Journal Link: [https://www.cambridge.org/core/journals/robotica/lyapunovbased-formation-control-of-underwater-robots](https://www.cambridge.org/core/journals/robotica/article/abs/lyapunovbased-formation-control-of-underwater-robots/EBBB0BBA1097C047541867FB61C197DC)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- REFERENCE -->
## Reference

If you are interested in this work, please cite:

```
@ARTICLE{
  authors={Keymasi Khalaji, Ali and Zahedifar, Rasoul},
  journal={Robotica},
  publisher={Cambridge University Press}
  title={Lyapunov-Based Formation Control of Underwater Robots}, 
  year={2020},
  volume={38},
  issue={6},
  pages={1105-1122},
  doi={10.1017/S0263574719001279}
  }
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots.svg?style=for-the-badge
[contributors-url]: https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots.svg?style=for-the-badge
[forks-url]: https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/network/members
[stars-shield]: https://img.shields.io/github/stars/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots.svg?style=for-the-badge
[stars-url]: https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/stargazers
[issues-shield]: https://img.shields.io/github/issues/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots.svg?style=for-the-badge
[issues-url]: https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/issues
[license-shield]: https://img.shields.io/github/license/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots.svg?style=for-the-badge
[license-url]: https://github.com/Rasoul-Zahedifar/Lyapunov-Based-Formation-Control-of-Underwater-Robots/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/rasoul-zahedifar