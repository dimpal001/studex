import React from 'react'

const OutSubjectsSection = () => {
  return (
    <section id='subjects' className='bg-white py-20 dark:bg-neutral-800'>
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-green-100 px-3 py-1 text-sm font-semibold text-green-800 dark:bg-green-900/30 dark:text-green-300'>
            Comprehensive Learning
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Explore Our Subjects
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Dive into a wide range of subjects with detailed chapters and
            interactive learning materials
          </p>
        </div>

        <div className='grid gap-6 sm:grid-cols-2 lg:grid-cols-4'>
          <div className='animate__animated animate__fadeInUp group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-indigo-100 text-indigo-600 transition-transform duration-300 group-hover:scale-110 dark:bg-indigo-900/30 dark:text-indigo-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-8 w-8'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z'
                ></path>
              </svg>
            </div>
            <h3 className='mb-2 text-xl font-bold text-gray-900 dark:text-white'>
              Mathematics
            </h3>
            <p className='mb-4 text-gray-600 dark:text-gray-400'>
              From algebra to calculus, master mathematical concepts with
              interactive problems and step-by-step solutions.
            </p>

            <div className='mb-4 space-y-2'>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-indigo-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Algebra &amp; Equations</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-indigo-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Geometry &amp; Trigonometry</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-indigo-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Calculus &amp; Functions</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-indigo-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Statistics &amp; Probability</span>
              </div>
            </div>

            <a
              href='#'
              className='inline-flex items-center text-sm font-medium text-indigo-600 transition-colors hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300'
            >
              Explore Subject
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-1 h-4 w-4'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-1s group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-green-100 text-green-600 transition-transform duration-300 group-hover:scale-110 dark:bg-green-900/30 dark:text-green-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-8 w-8'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z'
                ></path>
              </svg>
            </div>
            <h3 className='mb-2 text-xl font-bold text-gray-900 dark:text-white'>
              Science
            </h3>
            <p className='mb-4 text-gray-600 dark:text-gray-400'>
              Explore the wonders of physics, chemistry, and biology with
              engaging experiments and visual explanations.
            </p>

            <div className='mb-4 space-y-2'>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Physics &amp; Mechanics</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Chemistry &amp; Elements</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Biology &amp; Organisms</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Environmental Science</span>
              </div>
            </div>

            <a
              href='#'
              className='inline-flex items-center text-sm font-medium text-green-600 transition-colors hover:text-green-800 dark:text-green-400 dark:hover:text-green-300'
            >
              Explore Subject
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-1 h-4 w-4'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-2s group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-purple-100 text-purple-600 transition-transform duration-300 group-hover:scale-110 dark:bg-purple-900/30 dark:text-purple-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-8 w-8'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253'
                ></path>
              </svg>
            </div>
            <h3 className='mb-2 text-xl font-bold text-gray-900 dark:text-white'>
              English
            </h3>
            <p className='mb-4 text-gray-600 dark:text-gray-400'>
              Enhance your language skills through literature, grammar, writing
              exercises, and vocabulary building.
            </p>

            <div className='mb-4 space-y-2'>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-purple-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Grammar &amp; Composition</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-purple-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Literature &amp; Poetry</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-purple-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Vocabulary &amp; Word Usage</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-purple-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Reading Comprehension</span>
              </div>
            </div>

            <a
              href='#'
              className='inline-flex items-center text-sm font-medium text-purple-600 transition-colors hover:text-purple-800 dark:text-purple-400 dark:hover:text-purple-300'
            >
              Explore Subject
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-1 h-4 w-4'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-3s group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-amber-100 text-amber-600 transition-transform duration-300 group-hover:scale-110 dark:bg-amber-900/30 dark:text-amber-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-8 w-8'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h.5A2.5 2.5 0 0020 5.5v-1.565M12 13.5V21m-8-8L12 13.5 20 5.5'
                ></path>
              </svg>
            </div>
            <h3 className='mb-2 text-xl font-bold text-gray-900 dark:text-white'>
              Social Studies
            </h3>
            <p className='mb-4 text-gray-600 dark:text-gray-400'>
              Understand history, geography, civics, and economics through
              engaging narratives and visual timelines.
            </p>

            <div className='mb-4 space-y-2'>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-amber-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>History &amp; Civilization</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-amber-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Geography &amp; Maps</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-amber-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Civics &amp; Government</span>
              </div>
              <div className='flex items-center text-sm text-gray-600 dark:text-gray-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-4 w-4 text-amber-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                <span>Economics &amp; Finance</span>
              </div>
            </div>

            <a
              href='#'
              className='inline-flex items-center text-sm font-medium text-amber-600 transition-colors hover:text-amber-800 dark:text-amber-400 dark:hover:text-amber-300'
            >
              Explore Subject
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-1 h-4 w-4'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>

        <div className='mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3'>
          <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='flex items-center'>
              <div className='flex h-12 w-12 items-center justify-center rounded-full bg-blue-100 text-blue-600 transition-transform duration-300 group-hover:scale-110 dark:bg-blue-900/30 dark:text-blue-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-6 w-6'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z'
                  ></path>
                </svg>
              </div>
              <div className='ml-4'>
                <h3 className='text-lg font-bold text-gray-900 dark:text-white'>
                  Computer Science
                </h3>
                <p className='text-sm text-gray-600 dark:text-gray-400'>
                  Programming, algorithms, web development, and computing
                  concepts
                </p>
              </div>
            </div>
            <div className='mt-4 flex justify-end'>
              <a
                href='#'
                className='inline-flex items-center text-sm font-medium text-blue-600 transition-colors hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300'
              >
                Explore
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='ml-1 h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </a>
            </div>
          </div>

          <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='flex items-center'>
              <div className='flex h-12 w-12 items-center justify-center rounded-full bg-pink-100 text-pink-600 transition-transform duration-300 group-hover:scale-110 dark:bg-pink-900/30 dark:text-pink-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-6 w-6'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129'
                  ></path>
                </svg>
              </div>
              <div className='ml-4'>
                <h3 className='text-lg font-bold text-gray-900 dark:text-white'>
                  Foreign Languages
                </h3>
                <p className='text-sm text-gray-600 dark:text-gray-400'>
                  Spanish, French, German, and more with interactive exercises
                </p>
              </div>
            </div>
            <div className='mt-4 flex justify-end'>
              <a
                href='#'
                className='inline-flex items-center text-sm font-medium text-pink-600 transition-colors hover:text-pink-800 dark:text-pink-400 dark:hover:text-pink-300'
              >
                Explore
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='ml-1 h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </a>
            </div>
          </div>

          <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-900'>
            <div className='flex items-center'>
              <div className='flex h-12 w-12 items-center justify-center rounded-full bg-rose-100 text-rose-600 transition-transform duration-300 group-hover:scale-110 dark:bg-rose-900/30 dark:text-rose-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-6 w-6'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M9 19V6l12-3v13M9 19c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zm12-3c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zM9 10l12-3'
                  ></path>
                </svg>
              </div>
              <div className='ml-4'>
                <h3 className='text-lg font-bold text-gray-900 dark:text-white'>
                  Arts &amp; Music
                </h3>
                <p className='text-sm text-gray-600 dark:text-gray-400'>
                  Visual arts, music theory, and creative expression tutorials
                </p>
              </div>
            </div>
            <div className='mt-4 flex justify-end'>
              <a
                href='#'
                className='inline-flex items-center text-sm font-medium text-rose-600 transition-colors hover:text-rose-800 dark:text-rose-400 dark:hover:text-rose-300'
              >
                Explore
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='ml-1 h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </a>
            </div>
          </div>
        </div>

        <div className='mt-16 rounded-2xl bg-gradient-to-r from-indigo-100 to-purple-100 p-8 dark:from-indigo-900/40 dark:to-purple-900/40'>
          <div className='mx-auto max-w-4xl'>
            <h3 className='text-center text-2xl font-bold text-gray-900 dark:text-white'>
              Our Growing Library
            </h3>
            <p className='mt-2 text-center text-gray-600 dark:text-gray-300'>
              Constantly expanding to cover more subjects and topics
            </p>

            <div className='mt-8 grid gap-6 sm:grid-cols-2 md:grid-cols-4'>
              <div className='rounded-lg bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
                <div className='text-3xl font-bold text-indigo-600 dark:text-indigo-400'>
                  15+
                </div>
                <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                  Core Subjects
                </div>
              </div>

              <div className='rounded-lg bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
                <div className='text-3xl font-bold text-purple-600 dark:text-purple-400'>
                  850+
                </div>
                <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                  Chapters &amp; Topics
                </div>
              </div>

              <div className='rounded-lg bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
                <div className='text-3xl font-bold text-green-600 dark:text-green-400'>
                  25k+
                </div>
                <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                  Practice Questions
                </div>
              </div>

              <div className='rounded-lg bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
                <div className='text-3xl font-bold text-amber-600 dark:text-amber-400'>
                  500+
                </div>
                <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                  Ready-made Exams
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mt-16 rounded-2xl bg-indigo-600 p-8 text-center text-white dark:bg-indigo-700'>
          <h3 className='text-2xl font-bold'>Ready to explore all subjects?</h3>
          <p className='mt-2 text-indigo-100'>
            Download the app now and start your learning journey today
          </p>
          <div className='mt-6'>
            <a
              href='#download'
              className='inline-flex items-center rounded-lg bg-white px-6 py-3 text-sm font-medium text-indigo-600 shadow-lg transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl'
            >
              Get Started
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default OutSubjectsSection
