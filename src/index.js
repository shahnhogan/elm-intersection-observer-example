import { Elm } from './Main.elm'

const app = Elm.Main.init({ node: document.getElementById('app') })

if ('IntersectionObserver' in window) {
  const recommendations = document.querySelectorAll('.recommendation')

  const observer = new IntersectionObserver(
    entries => {
      entries.forEach(entry => {
        const currentElement = document.getElementById(entry.target.id)

        if (entry.isIntersecting) {
          app && app.ports.onIntersection.send(entry.target.id)
          currentElement && currentElement.classList.add('intersecting')
          currentElement && observer.unobserve(currentElement)
        }
      })
    },
    { threshold: 0.75 }
  )

  recommendations.forEach(recommendation => {
    observer && observer.observe(recommendation)
  })
}
