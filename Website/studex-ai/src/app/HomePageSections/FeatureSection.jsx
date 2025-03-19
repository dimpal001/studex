import React from 'react'

const FeatureSection = () => {
  return (
    <section id='features' className='bg-white py-20 dark:bg-neutral-900'>
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-indigo-100 px-3 py-1 text-sm font-semibold text-indigo-800 dark:bg-indigo-900/30 dark:text-indigo-300'>
            App Features
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Everything You Need for Learning Success
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Comprehensive tools and features designed to enhance your
            educational journey
          </p>
        </div>

        <div className='mt-12'>
          <div className='mx-auto max-w-6xl'>
            <div
              className='mb-8 flex flex-wrap justify-center gap-4'
              role='tablist'
              aria-orientation='horizontal'
            >
              <button
                className='feature-tab-btn rounded-lg bg-indigo-600 px-6 py-3 text-sm font-medium text-white shadow-md transition duration-300 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 dark:bg-indigo-700 dark:hover:bg-indigo-600 sm:text-base'
                id='tab-study'
                role='tab'
                aria-selected='true'
                aria-controls='panel-study'
              >
                <div className='flex items-center'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='mr-2 h-5 w-5'
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
                  <span>Study Materials</span>
                </div>
              </button>
              <button
                className='feature-tab-btn rounded-lg bg-white px-6 py-3 text-sm font-medium text-gray-700 shadow-md transition duration-300 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 dark:bg-neutral-800 dark:text-gray-200 dark:hover:bg-neutral-700 sm:text-base'
                id='tab-exams'
                role='tab'
                aria-selected='false'
                aria-controls='panel-exams'
              >
                <div className='flex items-center'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='mr-2 h-5 w-5'
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
                      d='M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01'
                    ></path>
                  </svg>
                  <span>Exam Preparation</span>
                </div>
              </button>
              <button
                className='feature-tab-btn rounded-lg bg-white px-6 py-3 text-sm font-medium text-gray-700 shadow-md transition duration-300 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 dark:bg-neutral-800 dark:text-gray-200 dark:hover:bg-neutral-700 sm:text-base'
                id='tab-community'
                role='tab'
                aria-selected='false'
                aria-controls='panel-community'
              >
                <div className='flex items-center'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='mr-2 h-5 w-5'
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
                      d='M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
                    ></path>
                  </svg>
                  <span>Community</span>
                </div>
              </button>
              <button
                className='feature-tab-btn rounded-lg bg-white px-6 py-3 text-sm font-medium text-gray-700 shadow-md transition duration-300 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 dark:bg-neutral-800 dark:text-gray-200 dark:hover:bg-neutral-700 sm:text-base'
                id='tab-personalization'
                role='tab'
                aria-selected='false'
                aria-controls='panel-personalization'
              >
                <div className='flex items-center'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='mr-2 h-5 w-5'
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
                      d='M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z'
                    ></path>
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M15 12a3 3 0 11-6 0 3 3 0 016 0z'
                    ></path>
                  </svg>
                  <span>Personalization</span>
                </div>
              </button>
            </div>

            <div className='tab-panels mt-8'>
              <div
                id='panel-study'
                role='tabpanel'
                aria-labelledby='tab-study'
                className='animate__animated animate__fadeIn'
              >
                <div className='overflow-hidden rounded-2xl bg-gradient-to-r from-indigo-50 to-blue-50 shadow-xl dark:from-indigo-900/20 dark:to-blue-900/20'>
                  <div className='grid gap-10 px-6 py-10 md:grid-cols-2 md:px-10'>
                    <div className='flex flex-col justify-center'>
                      <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                        Comprehensive Study Materials
                      </h3>
                      <p className='mt-4 text-lg text-gray-700 dark:text-gray-300'>
                        Access a vast library of subject-specific content
                        organized by chapters, making it easy to find what you
                        need.
                      </p>

                      <ul className='mt-8 space-y-4'>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Organized by Subjects &amp; Chapters
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Content is structured for easy navigation through
                              your educational journey
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Interactive Learning Materials
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Engage with content through quizzes, diagrams, and
                              interactive elements
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Save &amp; Bookmark
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Mark important content for quick reference during
                              revision
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Search &amp; Find
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Quickly locate specific topics with our powerful
                              search feature
                            </p>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div className='relative flex items-center justify-center'>
                      <div className='relative h-[500px] w-[280px] overflow-hidden rounded-[40px] border-[8px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                        <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 rounded-b-lg bg-gray-800 dark:bg-gray-700'></div>
                        <div className='p-2'>
                          <div className='rounded-t-2xl bg-indigo-600 p-3'>
                            <div className='flex items-center justify-between'>
                              <div className='flex items-center'>
                                <div className='mr-2 rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-5 w-5 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path d='M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z'></path>
                                  </svg>
                                </div>
                                <span className='text-sm font-medium text-white'>
                                  Science
                                </span>
                              </div>
                              <div className='flex items-center space-x-2'>
                                <div className='rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-4 w-4 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path
                                      fill-rule='evenodd'
                                      d='M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z'
                                      clip-rule='evenodd'
                                    ></path>
                                  </svg>
                                </div>
                                <div className='rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-4 w-4 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path d='M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z'></path>
                                  </svg>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='h-[410px] overflow-y-auto p-3'>
                            <h3 className='mb-3 text-lg font-semibold text-gray-900 dark:text-white'>
                              Physics - Chapter 3
                            </h3>
                            <h4 className='mb-4 text-base font-medium text-indigo-600 dark:text-indigo-400'>
                              Newton's Laws of Motion
                            </h4>

                            <div className='space-y-4'>
                              <div className='rounded-lg bg-indigo-50 p-3 dark:bg-indigo-900/30'>
                                <h5 className='mb-2 text-sm font-medium text-gray-900 dark:text-white'>
                                  First Law of Motion
                                </h5>
                                <p className='text-xs text-gray-700 dark:text-gray-300'>
                                  An object at rest stays at rest, and an object
                                  in motion stays in motion with the same speed
                                  and direction unless acted upon by an external
                                  force.
                                </p>
                              </div>

                              <div className='rounded-lg bg-blue-50 p-3 dark:bg-blue-900/30'>
                                <h5 className='mb-2 text-sm font-medium text-gray-900 dark:text-white'>
                                  Second Law of Motion
                                </h5>
                                <p className='text-xs text-gray-700 dark:text-gray-300'>
                                  The acceleration of an object depends on the
                                  mass of the object and the amount of force
                                  applied.
                                </p>
                                <div className='mt-2 rounded bg-white p-2 text-center text-sm font-medium text-gray-900 dark:bg-gray-700 dark:text-white'>
                                  F = ma
                                </div>
                              </div>

                              <div className='rounded-lg bg-purple-50 p-3 dark:bg-purple-900/30'>
                                <h5 className='mb-2 text-sm font-medium text-gray-900 dark:text-white'>
                                  Third Law of Motion
                                </h5>
                                <p className='text-xs text-gray-700 dark:text-gray-300'>
                                  For every action, there is an equal and
                                  opposite reaction.
                                </p>
                              </div>

                              <div className='rounded-lg bg-gray-100 p-3 dark:bg-gray-800'>
                                <h5 className='mb-2 flex items-center text-sm font-medium text-gray-900 dark:text-white'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='mr-1 h-4 w-4 text-amber-500'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path d='M11 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM15.657 5.757a1 1 0 00-1.414-1.414l-.707.707a1 1 0 001.414 1.414l.707-.707zM18 10a1 1 0 01-1 1h-1a1 1 0 110-2h1a1 1 0 011 1zM5.05 6.464A1 1 0 106.464 5.05l-.707-.707a1 1 0 00-1.414 1.414l.707.707zM5 10a1 1 0 01-1 1H3a1 1 0 110-2h1a1 1 0 011 1zM8 16v-1h4v1a2 2 0 11-4 0zM12 14c.015-.34.208-.646.477-.859a4 4 0 10-4.954 0c.27.213.462.519.476.859h4.002z'></path>
                                  </svg>
                                  Quick Example
                                </h5>
                                <p className='text-xs text-gray-700 dark:text-gray-300'>
                                  When you push a wall, the wall pushes back
                                  with equal force in the opposite direction.
                                </p>
                              </div>

                              <div className='rounded-lg border border-gray-200 p-3 dark:border-gray-700'>
                                <h5 className='mb-2 text-sm font-medium text-gray-900 dark:text-white'>
                                  Practice Questions
                                </h5>
                                <div className='space-y-2'>
                                  <div className='rounded bg-white p-2 text-xs text-gray-800 dark:bg-gray-700 dark:text-gray-200'>
                                    1. A 2kg object accelerates at 3m/s². What
                                    force is being applied?
                                  </div>
                                  <div className='rounded bg-white p-2 text-xs text-gray-800 dark:bg-gray-700 dark:text-gray-200'>
                                    2. Explain the concept of inertia using
                                    Newton's First Law.
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='flex justify-between border-t border-gray-200 bg-white px-2 py-2 dark:border-gray-700 dark:bg-gray-800'>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M9.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L7.414 9H15a1 1 0 110 2H7.414l2.293 2.293a1 1 0 010 1.414z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                            <div className='flex space-x-1'>
                              <div className='h-1.5 w-1.5 rounded-full bg-gray-300 dark:bg-gray-600'></div>
                              <div className='h-1.5 w-1.5 rounded-full bg-gray-300 dark:bg-gray-600'></div>
                              <div className='h-1.5 w-1.5 rounded-full bg-indigo-600'></div>
                              <div className='h-1.5 w-1.5 rounded-full bg-gray-300 dark:bg-gray-600'></div>
                            </div>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
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
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                id='panel-exams'
                role='tabpanel'
                aria-labelledby='tab-exams'
                className='hidden animate__animated animate__fadeIn'
              >
                <div className='overflow-hidden rounded-2xl bg-gradient-to-r from-purple-50 to-pink-50 shadow-xl dark:from-purple-900/20 dark:to-pink-900/20'>
                  <div className='grid gap-10 px-6 py-10 md:grid-cols-2 md:px-10'>
                    <div className='flex flex-col justify-center'>
                      <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                        Smart Exam Preparation
                      </h3>
                      <p className='mt-4 text-lg text-gray-700 dark:text-gray-300'>
                        Create customized exams tailored to your needs and track
                        your progress with detailed analytics.
                      </p>

                      <ul className='mt-8 space-y-4'>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-purple-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Create Custom Exams
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Select subjects, topics, number of questions, and
                              duration for a tailored experience
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-purple-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Challenge Friends
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Send exam challenges to friends and compete for
                              the highest score
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-purple-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Detailed Analytics
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Track performance with comprehensive reports
                              highlighting strengths and areas for improvement
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-purple-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Timed Tests
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Practice under exam conditions with customizable
                              time limits
                            </p>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div className='relative flex items-center justify-center'>
                      <div className='relative h-[500px] w-[280px] overflow-hidden rounded-[40px] border-[8px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                        <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 rounded-b-lg bg-gray-800 dark:bg-gray-700'></div>
                        <div className='p-2'>
                          <div className='rounded-t-2xl bg-purple-600 p-3'>
                            <div className='flex items-center justify-between'>
                              <div className='flex items-center'>
                                <div className='mr-2 rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-5 w-5 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path
                                      fill-rule='evenodd'
                                      d='M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z'
                                      clip-rule='evenodd'
                                    ></path>
                                  </svg>
                                </div>
                                <span className='text-sm font-medium text-white'>
                                  Math Exam
                                </span>
                              </div>
                              <div className='rounded-lg bg-white/20 px-2 py-1 text-xs font-medium text-white'>
                                15:42 left
                              </div>
                            </div>
                            <div className='mt-3 flex justify-between'>
                              <div className='text-xs text-white'>
                                Question 5 of 20
                              </div>
                              <div className='text-xs text-white'>
                                Score: 4/4
                              </div>
                            </div>
                            <div className='mt-2 h-1.5 w-full overflow-hidden rounded-full bg-white/20'>
                              <div className='h-full w-1/4 rounded-full bg-white'></div>
                            </div>
                          </div>

                          <div className='h-[410px] overflow-y-auto bg-gray-50 p-4 dark:bg-gray-900'>
                            <div className='rounded-lg bg-white p-4 shadow-sm dark:bg-gray-800'>
                              <h4 className='text-base font-medium text-gray-900 dark:text-white'>
                                Question 5
                              </h4>
                              <p className='mt-2 text-sm text-gray-700 dark:text-gray-300'>
                                Solve for x: 2x² + 5x - 3 = 0
                              </p>

                              <div className='mt-4 space-y-3'>
                                <div className='flex items-center rounded-lg border border-gray-200 px-3 py-2 dark:border-gray-700'>
                                  <div className='flex h-5 w-5 items-center justify-center rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-gray-700'>
                                    <span className='text-xs font-medium'>
                                      A
                                    </span>
                                  </div>
                                  <span className='ml-3 text-sm text-gray-700 dark:text-gray-300'>
                                    x = 0.5, x = -3
                                  </span>
                                </div>

                                <div className='flex items-center rounded-lg border border-purple-200 bg-purple-50 px-3 py-2 dark:border-purple-900 dark:bg-purple-900/30'>
                                  <div className='flex h-5 w-5 items-center justify-center rounded-full bg-purple-600 text-white'>
                                    <span className='text-xs font-medium'>
                                      B
                                    </span>
                                  </div>
                                  <span className='ml-3 text-sm font-medium text-purple-800 dark:text-purple-300'>
                                    x = -0.5, x = 3
                                  </span>
                                </div>

                                <div className='flex items-center rounded-lg border border-gray-200 px-3 py-2 dark:border-gray-700'>
                                  <div className='flex h-5 w-5 items-center justify-center rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-gray-700'>
                                    <span className='text-xs font-medium'>
                                      C
                                    </span>
                                  </div>
                                  <span className='ml-3 text-sm text-gray-700 dark:text-gray-300'>
                                    x = 1, x = -3
                                  </span>
                                </div>

                                <div className='flex items-center rounded-lg border border-gray-200 px-3 py-2 dark:border-gray-700'>
                                  <div className='flex h-5 w-5 items-center justify-center rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-gray-700'>
                                    <span className='text-xs font-medium'>
                                      D
                                    </span>
                                  </div>
                                  <span className='ml-3 text-sm text-gray-700 dark:text-gray-300'>
                                    x = -1, x = 3
                                  </span>
                                </div>
                              </div>
                            </div>

                            <div className='mt-4 rounded-lg bg-gray-100 p-4 dark:bg-gray-800'>
                              <div className='flex justify-between'>
                                <h5 className='text-sm font-medium text-gray-700 dark:text-gray-300'>
                                  Exam Progress
                                </h5>
                                <span className='text-xs text-gray-500 dark:text-gray-400'>
                                  5/20 completed
                                </span>
                              </div>
                              <div className='mt-3 grid grid-cols-5 gap-2'>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-green-500 text-xs font-medium text-white'>
                                  1
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-green-500 text-xs font-medium text-white'>
                                  2
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-green-500 text-xs font-medium text-white'>
                                  3
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-green-500 text-xs font-medium text-white'>
                                  4
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-purple-500 text-xs font-medium text-white'>
                                  5
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-gray-300 text-xs font-medium text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                                  6
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-gray-300 text-xs font-medium text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                                  7
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-gray-300 text-xs font-medium text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                                  8
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-gray-300 text-xs font-medium text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                                  9
                                </div>
                                <div className='flex h-8 w-8 items-center justify-center rounded bg-gray-300 text-xs font-medium text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                                  10
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='flex justify-between bg-white px-4 py-3 dark:bg-gray-800'>
                            <button className='flex items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='mr-1 h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M9.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L7.414 9H15a1 1 0 110 2H7.414l2.293 2.293a1 1 0 010 1.414z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                              Prev
                            </button>
                            <button className='flex items-center justify-center rounded-lg bg-purple-600 px-4 py-2 text-sm font-medium text-white hover:bg-purple-700'>
                              Next
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
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                id='panel-community'
                role='tabpanel'
                aria-labelledby='tab-community'
                className='hidden animate__animated animate__fadeIn'
              >
                <div className='overflow-hidden rounded-2xl bg-gradient-to-r from-teal-50 to-emerald-50 shadow-xl dark:from-teal-900/20 dark:to-emerald-900/20'>
                  <div className='grid gap-10 px-6 py-10 md:grid-cols-2 md:px-10'>
                    <div className='flex flex-col justify-center'>
                      <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                        Learning Community
                      </h3>
                      <p className='mt-4 text-lg text-gray-700 dark:text-gray-300'>
                        Connect with peers, share knowledge, and collaborate to
                        enhance your educational experience.
                      </p>

                      <ul className='mt-8 space-y-4'>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-teal-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Connect &amp; Follow
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Build your network by connecting with fellow
                              students and teachers
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-teal-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Ask &amp; Answer
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Post questions and provide answers to help others
                              in your community
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-teal-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Share Resources
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Exchange helpful study materials and exam
                              preparation tips
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-teal-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Group Discussions
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Join subject-specific groups to discuss complex
                              topics
                            </p>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div className='relative flex items-center justify-center'>
                      <div className='relative h-[500px] w-[280px] overflow-hidden rounded-[40px] border-[8px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                        <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 rounded-b-lg bg-gray-800 dark:bg-gray-700'></div>
                        <div className='p-2'>
                          <div className='rounded-t-2xl bg-teal-600 p-3'>
                            <div className='flex items-center justify-between'>
                              <div className='flex items-center'>
                                <div className='mr-2 rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-5 w-5 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path d='M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z'></path>
                                    <path d='M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z'></path>
                                  </svg>
                                </div>
                                <span className='text-sm font-medium text-white'>
                                  Community
                                </span>
                              </div>
                              <div className='flex items-center space-x-2'>
                                <div className='rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-4 w-4 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path
                                      fill-rule='evenodd'
                                      d='M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z'
                                      clip-rule='evenodd'
                                    ></path>
                                  </svg>
                                </div>
                                <div className='rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-4 w-4 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path d='M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z'></path>
                                  </svg>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='h-[410px] overflow-y-auto bg-gray-50 p-3 dark:bg-gray-900'>
                            <div className='flex items-center justify-between'>
                              <h4 className='text-sm font-medium text-gray-700 dark:text-gray-300'>
                                Recent Questions
                              </h4>
                              <button className='rounded-full bg-teal-100 p-1 text-teal-600 dark:bg-teal-900/30 dark:text-teal-400'>
                                <svg
                                  xmlns='http://www.w3.org/2000/svg'
                                  className='h-4 w-4'
                                  viewBox='0 0 20 20'
                                  fill='currentColor'
                                  data-darkreader-inline-fill=''
                                  styles='--darkreader-inline-fill: currentColor;'
                                >
                                  <path
                                    fill-rule='evenodd'
                                    d='M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z'
                                    clip-rule='evenodd'
                                  ></path>
                                </svg>
                              </button>
                            </div>

                            <div className='mt-3 space-y-3'>
                              <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                <div className='flex items-start space-x-3'>
                                  <div className='flex-shrink-0'>
                                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-indigo-100 text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'>
                                      <span className='text-xs font-semibold'>
                                        RK
                                      </span>
                                    </div>
                                  </div>
                                  <div className='min-w-0 flex-1'>
                                    <div className='flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-900 dark:text-white'>
                                        Rahul Kumar
                                      </p>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        2h ago
                                      </p>
                                    </div>
                                    <h5 className='mt-1 text-sm font-medium text-gray-900 dark:text-white'>
                                      How do you solve quadratic equations?
                                    </h5>
                                    <p className='mt-1 text-xs text-gray-600 dark:text-gray-400'>
                                      I'm struggling with the formula. Can
                                      someone explain it step by step?
                                    </p>
                                    <div className='mt-2 flex items-center space-x-2'>
                                      <span className='inline-flex items-center rounded-full bg-teal-100 px-2 py-0.5 text-xs font-medium text-teal-800 dark:bg-teal-900/30 dark:text-teal-300'>
                                        Mathematics
                                      </span>
                                      <span className='text-xs text-gray-500 dark:text-gray-400'>
                                        • 8 answers
                                      </span>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                <div className='flex items-start space-x-3'>
                                  <div className='flex-shrink-0'>
                                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-pink-100 text-pink-600 dark:bg-pink-900/30 dark:text-pink-400'>
                                      <span className='text-xs font-semibold'>
                                        AP
                                      </span>
                                    </div>
                                  </div>
                                  <div className='min-w-0 flex-1'>
                                    <div className='flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-900 dark:text-white'>
                                        Ananya Patel
                                      </p>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        5h ago
                                      </p>
                                    </div>
                                    <h5 className='mt-1 text-sm font-medium text-gray-900 dark:text-white'>
                                      Difference between mitosis and meiosis?
                                    </h5>
                                    <p className='mt-1 text-xs text-gray-600 dark:text-gray-400'>
                                      I keep mixing up these concepts in
                                      biology. Any tips to remember?
                                    </p>
                                    <div className='mt-2 flex items-center space-x-2'>
                                      <span className='inline-flex items-center rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800 dark:bg-green-900/30 dark:text-green-300'>
                                        Biology
                                      </span>
                                      <span className='text-xs text-gray-500 dark:text-gray-400'>
                                        • 4 answers
                                      </span>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <div className='rounded-lg bg-teal-50 p-3 shadow-sm dark:bg-teal-900/20'>
                                <div className='flex items-start space-x-3'>
                                  <div className='flex-shrink-0'>
                                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-amber-100 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                                      <span className='text-xs font-semibold'>
                                        SK
                                      </span>
                                    </div>
                                  </div>
                                  <div className='min-w-0 flex-1'>
                                    <div className='flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-900 dark:text-white'>
                                        Suhani Khan
                                      </p>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        8h ago
                                      </p>
                                    </div>
                                    <h5 className='mt-1 text-sm font-medium text-gray-900 dark:text-white'>
                                      Newton's Third Law examples?
                                    </h5>
                                    <p className='mt-1 text-xs text-gray-600 dark:text-gray-400'>
                                      Need everyday examples for my science
                                      project. Thanks!
                                    </p>
                                    <div className='mt-2 flex items-center space-x-2'>
                                      <span className='inline-flex items-center rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800 dark:bg-blue-900/30 dark:text-blue-300'>
                                        Physics
                                      </span>
                                      <span className='text-xs text-gray-500 dark:text-gray-400'>
                                        • 12 answers
                                      </span>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                <div className='flex items-start space-x-3'>
                                  <div className='flex-shrink-0'>
                                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-purple-100 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                                      <span className='text-xs font-semibold'>
                                        VR
                                      </span>
                                    </div>
                                  </div>
                                  <div className='min-w-0 flex-1'>
                                    <div className='flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-900 dark:text-white'>
                                        Vikram Reddy
                                      </p>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        12h ago
                                      </p>
                                    </div>
                                    <h5 className='mt-1 text-sm font-medium text-gray-900 dark:text-white'>
                                      Tips for memorizing historical dates?
                                    </h5>
                                    <p className='mt-1 text-xs text-gray-600 dark:text-gray-400'>
                                      I'm preparing for my history exam and
                                      struggling with dates.
                                    </p>
                                    <div className='mt-2 flex items-center space-x-2'>
                                      <span className='inline-flex items-center rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-800 dark:bg-red-900/30 dark:text-red-300'>
                                        History
                                      </span>
                                      <span className='text-xs text-gray-500 dark:text-gray-400'>
                                        • 6 answers
                                      </span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='flex justify-between border-t border-gray-200 bg-white p-2 dark:border-gray-700 dark:bg-gray-800'>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z'></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-teal-600 dark:text-teal-400'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z'></path>
                                <path d='M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z'></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z'></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                id='panel-personalization'
                role='tabpanel'
                aria-labelledby='tab-personalization'
                className='hidden animate__animated animate__fadeIn'
              >
                <div className='overflow-hidden rounded-2xl bg-gradient-to-r from-amber-50 to-orange-50 shadow-xl dark:from-amber-900/20 dark:to-orange-900/20'>
                  <div className='grid gap-10 px-6 py-10 md:grid-cols-2 md:px-10'>
                    <div className='flex flex-col justify-center'>
                      <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                        Personalized Learning
                      </h3>
                      <p className='mt-4 text-lg text-gray-700 dark:text-gray-300'>
                        Tailor your learning experience with customizable
                        profiles, preferences, and personalized recommendations.
                      </p>

                      <ul className='mt-8 space-y-4'>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-amber-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Custom Study Schedule
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Create personalized study plans based on your
                              availability and learning pace
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-amber-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Adaptive Learning
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              The app adjusts to your performance, focusing more
                              on areas that need improvement
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-amber-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Progress Tracking
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Monitor your learning journey with detailed
                              progress reports and achievement badges
                            </p>
                          </div>
                        </li>
                        <li className='flex items-start'>
                          <div className='flex-shrink-0'>
                            <div className='flex h-6 w-6 items-center justify-center rounded-full bg-amber-500 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-4 w-4'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                          <div className='ml-3'>
                            <h4 className='text-lg font-medium text-gray-900 dark:text-white'>
                              Customizable Interface
                            </h4>
                            <p className='mt-1 text-gray-600 dark:text-gray-400'>
                              Adjust the app's appearance and layout to match
                              your preferences
                            </p>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div className='relative flex items-center justify-center'>
                      <div className='relative h-[500px] w-[280px] overflow-hidden rounded-[40px] border-[8px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                        <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 rounded-b-lg bg-gray-800 dark:bg-gray-700'></div>
                        <div className='p-2'>
                          <div className='rounded-t-2xl bg-amber-600 p-3'>
                            <div className='flex items-center justify-between'>
                              <div className='flex items-center'>
                                <div className='mr-2 rounded-full bg-white/20 p-1'>
                                  <svg
                                    xmlns='http://www.w3.org/2000/svg'
                                    className='h-5 w-5 text-white'
                                    viewBox='0 0 20 20'
                                    fill='currentColor'
                                    data-darkreader-inline-fill=''
                                    styles='--darkreader-inline-fill: currentColor;'
                                  >
                                    <path
                                      fill-rule='evenodd'
                                      d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                                      clip-rule='evenodd'
                                    ></path>
                                  </svg>
                                </div>
                                <span className='text-sm font-medium text-white'>
                                  My Profile
                                </span>
                              </div>
                              <div className='rounded-full bg-white/20 p-1'>
                                <svg
                                  xmlns='http://www.w3.org/2000/svg'
                                  className='h-4 w-4 text-white'
                                  viewBox='0 0 20 20'
                                  fill='currentColor'
                                  data-darkreader-inline-fill=''
                                  styles='--darkreader-inline-fill: currentColor;'
                                >
                                  <path d='M5 4a1 1 0 00-2 0v7.268a2 2 0 000 3.464V16a1 1 0 102 0v-1.268a2 2 0 000-3.464V4zM11 4a1 1 0 10-2 0v1.268a2 2 0 000 3.464V16a1 1 0 102 0V8.732a2 2 0 000-3.464V4zM16 3a1 1 0 011 1v7.268a2 2 0 010 3.464V16a1 1 0 11-2 0v-1.268a2 2 0 010-3.464V4a1 1 0 011-1z'></path>
                                </svg>
                              </div>
                            </div>

                            <div className='mt-4 flex flex-col items-center'>
                              <div className='h-16 w-16 overflow-hidden rounded-full bg-amber-300 ring-4 ring-white/30'>
                                <div className='flex h-full w-full items-center justify-center text-2xl font-semibold text-amber-800'>
                                  RP
                                </div>
                              </div>
                              <h3 className='mt-2 text-base font-semibold text-white'>
                                Ravi Prakash
                              </h3>
                              <p className='text-xs text-amber-100'>
                                Class 10 • Science Stream
                              </p>
                            </div>
                          </div>

                          <div className='h-[410px] overflow-y-auto bg-gray-50 p-4 dark:bg-gray-900'>
                            <div>
                              <h4 className='mb-3 text-sm font-medium text-gray-700 dark:text-gray-300'>
                                Learning Stats
                              </h4>
                              <div className='grid grid-cols-2 gap-2'>
                                <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                  <div className='flex items-center'>
                                    <div className='rounded-full bg-indigo-100 p-2 dark:bg-indigo-900/30'>
                                      <svg
                                        xmlns='http://www.w3.org/2000/svg'
                                        className='h-4 w-4 text-indigo-600 dark:text-indigo-400'
                                        viewBox='0 0 20 20'
                                        fill='currentColor'
                                        data-darkreader-inline-fill=''
                                        styles='--darkreader-inline-fill: currentColor;'
                                      >
                                        <path d='M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838l-2.727 1.17 1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z'></path>
                                      </svg>
                                    </div>
                                    <div className='ml-3'>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        Chapters
                                      </p>
                                      <p className='text-base font-semibold text-gray-900 dark:text-white'>
                                        24/36
                                      </p>
                                    </div>
                                  </div>
                                </div>
                                <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                  <div className='flex items-center'>
                                    <div className='rounded-full bg-green-100 p-2 dark:bg-green-900/30'>
                                      <svg
                                        xmlns='http://www.w3.org/2000/svg'
                                        className='h-4 w-4 text-green-600 dark:text-green-400'
                                        viewBox='0 0 20 20'
                                        fill='currentColor'
                                        data-darkreader-inline-fill=''
                                        styles='--darkreader-inline-fill: currentColor;'
                                      >
                                        <path
                                          fill-rule='evenodd'
                                          d='M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                                          clip-rule='evenodd'
                                        ></path>
                                      </svg>
                                    </div>
                                    <div className='ml-3'>
                                      <p className='text-xs text-gray-500 dark:text-gray-400'>
                                        Quizzes
                                      </p>
                                      <p className='text-base font-semibold text-gray-900 dark:text-white'>
                                        18
                                      </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div className='mt-4'>
                              <h4 className='mb-2 text-sm font-medium text-gray-700 dark:text-gray-300'>
                                My Progress
                              </h4>
                              <div className='rounded-lg bg-white p-4 shadow-sm dark:bg-gray-800'>
                                <div className='flex items-end justify-between'>
                                  <div>
                                    <p className='text-xs text-gray-500 dark:text-gray-400'>
                                      Overall Completion
                                    </p>
                                    <p className='text-lg font-bold text-gray-900 dark:text-white'>
                                      68%
                                    </p>
                                  </div>
                                  <div className='flex flex-shrink-0 items-center rounded-full bg-amber-100 p-1 text-amber-500 dark:bg-amber-900/30 dark:text-amber-400'>
                                    <svg
                                      xmlns='http://www.w3.org/2000/svg'
                                      className='h-4 w-4'
                                      viewBox='0 0 20 20'
                                      fill='currentColor'
                                      data-darkreader-inline-fill=''
                                      styles='--darkreader-inline-fill: currentColor;'
                                    >
                                      <path
                                        fill-rule='evenodd'
                                        d='M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z'
                                        clip-rule='evenodd'
                                      ></path>
                                    </svg>
                                  </div>
                                </div>
                                <div className='mt-2 h-2 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700'>
                                  <div className='h-full w-[68%] rounded-full bg-amber-500'></div>
                                </div>

                                <div className='mt-4 space-y-2'>
                                  <div>
                                    <div className='mb-1 flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        Mathematics
                                      </p>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        82%
                                      </p>
                                    </div>
                                    <div className='h-1.5 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700'>
                                      <div className='h-full w-[82%] rounded-full bg-indigo-500'></div>
                                    </div>
                                  </div>
                                  <div>
                                    <div className='mb-1 flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        Science
                                      </p>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        75%
                                      </p>
                                    </div>
                                    <div className='h-1.5 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700'>
                                      <div className='h-full w-[75%] rounded-full bg-green-500'></div>
                                    </div>
                                  </div>
                                  <div>
                                    <div className='mb-1 flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        English
                                      </p>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        60%
                                      </p>
                                    </div>
                                    <div className='h-1.5 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700'>
                                      <div className='h-full w-[60%] rounded-full bg-purple-500'></div>
                                    </div>
                                  </div>
                                  <div>
                                    <div className='mb-1 flex items-center justify-between'>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        Social Studies
                                      </p>
                                      <p className='text-xs font-medium text-gray-600 dark:text-gray-400'>
                                        45%
                                      </p>
                                    </div>
                                    <div className='h-1.5 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700'>
                                      <div className='h-full w-[45%] rounded-full bg-blue-500'></div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div className='mt-4'>
                              <h4 className='mb-2 text-sm font-medium text-gray-700 dark:text-gray-300'>
                                Study Recommendations
                              </h4>
                              <div className='space-y-2'>
                                <div className='rounded-lg bg-white p-3 shadow-sm dark:bg-gray-800'>
                                  <div className='flex items-center justify-between'>
                                    <div className='flex items-center'>
                                      <div className='rounded-lg bg-blue-100 p-2 dark:bg-blue-900/30'>
                                        <svg
                                          xmlns='http://www.w3.org/2000/svg'
                                          className='h-4 w-4 text-blue-600 dark:text-blue-400'
                                          viewBox='0 0 20 20'
                                          fill='currentColor'
                                          data-darkreader-inline-fill=''
                                          styles='--darkreader-inline-fill: currentColor;'
                                        >
                                          <path d='M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z'></path>
                                        </svg>
                                      </div>
                                      <div className='ml-3'>
                                        <p className='text-sm font-medium text-gray-900 dark:text-white'>
                                          Social Studies
                                        </p>
                                        <p className='text-xs text-gray-500 dark:text-gray-400'>
                                          Needs more attention
                                        </p>
                                      </div>
                                    </div>
                                    <button className='rounded-full bg-blue-50 p-1 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400'>
                                      <svg
                                        xmlns='http://www.w3.org/2000/svg'
                                        className='h-4 w-4'
                                        viewBox='0 0 20 20'
                                        fill='currentColor'
                                        data-darkreader-inline-fill=''
                                        styles='--darkreader-inline-fill: currentColor;'
                                      >
                                        <path
                                          fill-rule='evenodd'
                                          d='M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z'
                                          clip-rule='evenodd'
                                        ></path>
                                      </svg>
                                    </button>
                                  </div>
                                </div>

                                <div className='rounded-lg bg-amber-50 p-3 shadow-sm dark:bg-amber-900/20'>
                                  <div className='flex items-center justify-between'>
                                    <div className='flex items-center'>
                                      <div className='rounded-lg bg-amber-100 p-2 dark:bg-amber-900/30'>
                                        <svg
                                          xmlns='http://www.w3.org/2000/svg'
                                          className='h-4 w-4 text-amber-600 dark:text-amber-400'
                                          viewBox='0 0 20 20'
                                          fill='currentColor'
                                          data-darkreader-inline-fill=''
                                          styles='--darkreader-inline-fill: currentColor;'
                                        >
                                          <path d='M5 4a1 1 0 00-2 0v7.268a2 2 0 000 3.464V16a1 1 0 102 0v-1.268a2 2 0 000-3.464V4zM11 4a1 1 0 10-2 0v1.268a2 2 0 000 3.464V16a1 1 0 102 0V8.732a2 2 0 000-3.464V4zM16 3a1 1 0 011 1v7.268a2 2 0 010 3.464V16a1 1 0 11-2 0v-1.268a2 2 0 010-3.464V4a1 1 0 011-1z'></path>
                                        </svg>
                                      </div>
                                      <div className='ml-3'>
                                        <p className='text-sm font-medium text-gray-900 dark:text-amber-100'>
                                          Weekly Study Plan
                                        </p>
                                        <p className='text-xs text-gray-500 dark:text-amber-200/70'>
                                          Updated based on your progress
                                        </p>
                                      </div>
                                    </div>
                                    <button className='rounded-full bg-amber-100 p-1 text-amber-600 dark:bg-amber-900/50 dark:text-amber-400'>
                                      <svg
                                        xmlns='http://www.w3.org/2000/svg'
                                        className='h-4 w-4'
                                        viewBox='0 0 20 20'
                                        fill='currentColor'
                                        data-darkreader-inline-fill=''
                                        styles='--darkreader-inline-fill: currentColor;'
                                      >
                                        <path
                                          fill-rule='evenodd'
                                          d='M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z'
                                          clip-rule='evenodd'
                                        ></path>
                                      </svg>
                                    </button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className='flex justify-between border-t border-gray-200 bg-white p-2 dark:border-gray-700 dark:bg-gray-800'>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z'></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                            <button className='rounded-full p-2 text-amber-600 dark:text-amber-400'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-5 w-5'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mt-24'>
          <div className='mx-auto max-w-2xl text-center'>
            <h2 className='text-2xl font-bold text-gray-900 dark:text-white sm:text-3xl'>
              More Powerful Features
            </h2>
            <p className='mt-3 text-lg text-gray-600 dark:text-gray-400'>
              Discover all the tools that make learning effective and enjoyable
            </p>
          </div>

          <div className='mx-auto mt-12 grid max-w-screen-xl gap-8 sm:grid-cols-2 lg:grid-cols-3'>
            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-purple-500 to-indigo-600 text-white'>
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
                    d='M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Customizable Study Plans
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Create personalized study plans tailored to your goals,
                available time, and preferred learning methods.
              </p>
            </div>

            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-amber-500 to-orange-600 text-white'>
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
                    d='M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Smart Recommendations
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Get intelligent suggestions for study materials, practice
                questions, and exam preparation based on your performance.
              </p>
            </div>

            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-green-500 to-teal-600 text-white'>
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
                    d='M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Offline Access
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Download study materials, exams, and practice questions for
                offline use during travel or when internet connectivity is
                limited.
              </p>
            </div>

            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-pink-500 to-rose-600 text-white'>
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
                    d='M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Gamified Learning
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Earn points, badges, and achievements as you progress through
                your studies, making learning more engaging and fun.
              </p>
            </div>

            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-blue-500 to-cyan-600 text-white'>
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
                    d='M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Flashcards &amp; Notes
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Create digital flashcards and organized notes for effective
                revision, with automatic syncing across all your devices.
              </p>
            </div>

            <div className='group rounded-xl bg-white p-6 shadow-lg transition duration-300 hover:shadow-xl dark:bg-neutral-800'>
              <div className='mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-gradient-to-br from-violet-500 to-purple-600 text-white'>
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
                    d='M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9'
                  ></path>
                </svg>
              </div>
              <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
                Reminders &amp; Alerts
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Stay on track with customized notifications for upcoming exams,
                study sessions, and assignment deadlines.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}

export default FeatureSection
