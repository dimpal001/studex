import React from 'react'

const HeroSection = () => {
  return (
    <section
      id='hero'
      className='relative overflow-hidden bg-gradient-to-br from-indigo-700 to-purple-800 py-16 dark:from-indigo-900 dark:to-purple-900'
    >
      <div className='absolute inset-0 z-0'>
        <div className='absolute -right-10 -top-10 h-64 w-64 rounded-full bg-indigo-500 opacity-30 blur-3xl'></div>
        <div className='absolute -bottom-10 left-20 h-72 w-72 rounded-full bg-purple-500 opacity-30 blur-3xl'></div>
        <div className='absolute right-32 top-40 h-40 w-40 rounded-full bg-teal-400 opacity-20 blur-2xl'></div>
      </div>

      <div className='container relative z-10 mx-auto flex flex-col-reverse items-center px-4 py-12 md:flex-row md:space-x-8 lg:py-20'>
        <div className='mt-12 w-full text-center md:mt-0 md:w-1/2 md:text-left'>
          <h1 className='animate__animated animate__fadeInUp mb-4 text-4xl font-extrabold tracking-tight text-white md:text-5xl lg:text-6xl'>
            Learn, Connect, Excel
          </h1>
          <p className='animate__animated animate__fadeInUp animate__delay-1s mb-8 text-lg text-indigo-100 md:text-xl'>
            Your complete educational companion with interactive learning,
            personalized exams, and a collaborative community.
          </p>
          <div className='animate__animated animate__fadeInUp animate__delay-2s flex flex-col space-y-4 sm:flex-row sm:space-x-4 sm:space-y-0'>
            <a
              href='#download'
              className='rounded-lg bg-gradient-to-r from-amber-500 to-amber-600 px-6 py-3 text-base font-semibold text-white shadow-lg transition-transform duration-300 hover:scale-105 focus:outline-none focus:ring-2 focus:ring-amber-300 focus:ring-offset-2 focus:ring-offset-indigo-800'
            >
              Download App
            </a>
            <a
              href='#how-it-works'
              className='rounded-lg bg-white/10 px-6 py-3 text-base font-semibold text-white backdrop-blur-sm transition-colors duration-300 hover:bg-white/20 focus:outline-none focus:ring-2 focus:ring-white/30 focus:ring-offset-2 focus:ring-offset-indigo-800'
            >
              Learn More
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-3s mt-10'>
            <p className='mb-4 text-sm font-medium text-indigo-200'>
              Trusted by students from:
            </p>
            <div className='flex flex-wrap items-center justify-center space-x-6 md:justify-start'>
              <div className='mb-4 flex h-8 items-center text-indigo-200'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fillRule='evenodd'
                    d='M10 2a8 8 0 100 16 8 8 0 000-16zm0 14a6 6 0 100-12 6 6 0 000 12z'
                    clipRule='evenodd'
                  ></path>
                  <path d='M10 4a1 1 0 011 1v5.268l3.265 1.889a1 1 0 01-.5 1.886L9.5 12.268V5a1 1 0 011-1z'></path>
                </svg>
                <span>500+ Schools</span>
              </div>
              <div className='mb-4 flex h-8 items-center text-indigo-200'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fillRule='evenodd'
                    d='M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z'
                    clipRule='evenodd'
                  ></path>
                </svg>
                <span>100K+ Students</span>
              </div>
              <div className='mb-4 flex h-8 items-center text-indigo-200'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-2 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z'></path>
                </svg>
                <span>4.8 App Rating</span>
              </div>
            </div>
          </div>
        </div>

        <div className='w-full md:w-1/2'>
          <div className='relative mx-auto max-w-sm'>
            <div className='animate__animated animate__zoomIn relative mx-auto rounded-[2.5rem] border-[0.4rem] border-gray-800 bg-gray-800 p-1 shadow-xl dark:border-gray-700'>
              <div className='absolute left-1/2 top-0 z-10 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
              <div className='overflow-hidden rounded-[2rem] bg-white'>
                <div className='relative bg-white dark:bg-gray-800'>
                  <div className='overflow-hidden'>
                    <div className='relative'>
                      <div className='bg-gradient-to-r from-indigo-600 to-purple-600 p-4'>
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
                                <path d='M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838l-2.727 1.17 1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z'></path>
                              </svg>
                            </div>
                            <span className='text-sm font-semibold text-white'>
                              EduLearn
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
                                <path d='M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z'></path>
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
                                <path
                                  fillRule='evenodd'
                                  d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z'
                                  clipRule='evenodd'
                                ></path>
                              </svg>
                            </div>
                          </div>
                        </div>
                        <div className='mt-6 text-center'>
                          <p className='text-xs font-medium text-white/80'>
                            Hello, Student!
                          </p>
                          <h3 className='text-lg font-bold text-white'>
                            What would you like to learn today?
                          </h3>
                        </div>
                      </div>

                      <div className='h-72 bg-gray-50 px-3 py-4 dark:bg-gray-900'>
                        <div className='grid grid-cols-2 gap-3'>
                          <div className='rounded-xl bg-white p-3 shadow-sm dark:bg-gray-800'>
                            <div className='mb-2 h-8 w-8 rounded-full bg-amber-100 p-1.5 dark:bg-amber-900/30'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-full w-full text-amber-500'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M10 3.5a1.5 1.5 0 013 0V4a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-.5a1.5 1.5 0 000 3h.5a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-.5a1.5 1.5 0 00-3 0v.5a1 1 0 01-1 1H6a1 1 0 01-1-1v-3a1 1 0 00-1-1h-.5a1.5 1.5 0 010-3H4a1 1 0 001-1V6a1 1 0 011-1h3a1 1 0 001-1v-.5z'></path>
                              </svg>
                            </div>
                            <h4 className='text-xs font-semibold text-gray-900 dark:text-white'>
                              Mathematics
                            </h4>
                            <p className='mt-1 text-[0.65rem] text-gray-500 dark:text-gray-400'>
                              3 Chapters
                            </p>
                          </div>
                          <div className='rounded-xl bg-white p-3 shadow-sm dark:bg-gray-800'>
                            <div className='mb-2 h-8 w-8 rounded-full bg-green-100 p-1.5 dark:bg-green-900/30'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-full w-full text-green-500'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fillRule='evenodd'
                                  d='M4 2a2 2 0 00-2 2v11a3 3 0 106 0V4a2 2 0 00-2-2H4zm1 14a1 1 0 100-2 1 1 0 000 2zm5-1.757l4.9-4.9a2 2 0 000-2.828L13.485 5.1a2 2 0 00-2.828 0L10 5.757v8.486zM16 18H9.071l6-6H16a2 2 0 012 2v2a2 2 0 01-2 2z'
                                  clipRule='evenodd'
                                ></path>
                              </svg>
                            </div>
                            <h4 className='text-xs font-semibold text-gray-900 dark:text-white'>
                              Science
                            </h4>
                            <p className='mt-1 text-[0.65rem] text-gray-500 dark:text-gray-400'>
                              5 Chapters
                            </p>
                          </div>
                          <div className='rounded-xl bg-white p-3 shadow-sm dark:bg-gray-800'>
                            <div className='mb-2 h-8 w-8 rounded-full bg-purple-100 p-1.5 dark:bg-purple-900/30'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-full w-full text-purple-500'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z'></path>
                              </svg>
                            </div>
                            <h4 className='text-xs font-semibold text-gray-900 dark:text-white'>
                              English
                            </h4>
                            <p className='mt-1 text-[0.65rem] text-gray-500 dark:text-gray-400'>
                              2 Chapters
                            </p>
                          </div>
                          <div className='rounded-xl bg-white p-3 shadow-sm dark:bg-gray-800'>
                            <div className='mb-2 h-8 w-8 rounded-full bg-blue-100 p-1.5 dark:bg-blue-900/30'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-full w-full text-blue-500'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fillRule='evenodd'
                                  d='M12 1.586l-4 4v12.828l4-4V1.586zM3.707 3.293A1 1 0 002 4v10a1 1 0 00.293.707L6 18.414V5.586L3.707 3.293zM17.707 5.293L14 1.586v12.828l2.293 2.293A1 1 0 0018 16V6a1 1 0 00-.293-.707z'
                                  clipRule='evenodd'
                                ></path>
                              </svg>
                            </div>
                            <h4 className='text-xs font-semibold text-gray-900 dark:text-white'>
                              Geography
                            </h4>
                            <p className='mt-1 text-[0.65rem] text-gray-500 dark:text-gray-400'>
                              4 Chapters
                            </p>
                          </div>
                        </div>

                        <div className='mt-4'>
                          <h5 className='mb-2 text-xs font-medium text-gray-500 dark:text-gray-400'>
                            Quick Actions
                          </h5>
                          <div className='flex space-x-2'>
                            <button className='flex flex-1 items-center justify-center rounded-lg bg-indigo-50 py-2 text-xs font-medium text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='mr-1 h-3 w-3'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path d='M9 2a2 2 0 00-2 2v8a2 2 0 002 2h6a2 2 0 002-2V6.414A2 2 0 0016.414 5L14 2.586A2 2 0 0012.586 2H9z'></path>
                                <path d='M3 8a2 2 0 012-2h2a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2V8z'></path>
                              </svg>
                              My Exams
                            </button>
                            <button className='flex flex-1 items-center justify-center rounded-lg bg-amber-50 py-2 text-xs font-medium text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='mr-1 h-3 w-3'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fillRule='evenodd'
                                  d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z'
                                  clipRule='evenodd'
                                ></path>
                              </svg>
                              Ask Q&amp;A
                            </button>
                          </div>
                        </div>
                      </div>

                      <div className='flex items-center justify-around bg-white p-3 dark:bg-gray-800'>
                        <button className='flex flex-col items-center'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z'></path>
                          </svg>
                          <span className='mt-1 text-[0.6rem] text-gray-700 dark:text-gray-300'>
                            Home
                          </span>
                        </button>
                        <button className='flex flex-col items-center opacity-60'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-600 dark:text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z'></path>
                          </svg>
                          <span className='mt-1 text-[0.6rem] text-gray-600 dark:text-gray-400'>
                            Subjects
                          </span>
                        </button>
                        <button className='flex flex-col items-center opacity-60'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-600 dark:text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fillRule='evenodd'
                              d='M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z'
                              clipRule='evenodd'
                            ></path>
                          </svg>
                          <span className='mt-1 text-[0.6rem] text-gray-600 dark:text-gray-400'>
                            Exams
                          </span>
                        </button>
                        <button className='flex flex-col items-center opacity-60'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-5 w-5 text-gray-600 dark:text-gray-400'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fillRule='evenodd'
                              d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                              clipRule='evenodd'
                            ></path>
                          </svg>
                          <span className='mt-1 text-[0.6rem] text-gray-600 dark:text-gray-400'>
                            Profile
                          </span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div className='animate__animated animate__fadeInRight animate__delay-2s absolute -right-12 bottom-8 hidden w-56 rotate-6 rounded-2xl border-[0.25rem] border-gray-800 bg-gray-800 p-1 shadow-xl md:block'>
              <div className='overflow-hidden rounded-xl bg-white dark:bg-gray-800'>
                <div className='bg-purple-600 p-3'>
                  <div className='flex items-center justify-between'>
                    <h5 className='text-xs font-semibold text-white'>
                      Math Challenge
                    </h5>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-4 w-4 text-white'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fillRule='evenodd'
                        d='M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z'
                        clipRule='evenodd'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='p-3'>
                  <div className='rounded-lg bg-gray-100 p-2 text-center dark:bg-gray-700'>
                    <p className='text-xs font-medium text-gray-800 dark:text-gray-200'>
                      If x² + 6x + 9 = 0, then x = ?
                    </p>
                  </div>
                  <div className='mt-2 grid grid-cols-2 gap-2'>
                    <div className='rounded-md bg-purple-100 p-1 text-center text-xs text-purple-700 dark:bg-purple-900/30 dark:text-purple-400'>
                      -3
                    </div>
                    <div className='rounded-md bg-gray-100 p-1 text-center text-xs text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                      3
                    </div>
                    <div className='rounded-md bg-gray-100 p-1 text-center text-xs text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                      0
                    </div>
                    <div className='rounded-md bg-gray-100 p-1 text-center text-xs text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                      -9
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='container relative z-10 mx-auto mt-12 px-4'>
        <div className='flex flex-col items-center'>
          <p className='mb-6 text-center text-sm font-medium text-indigo-200'>
            As featured in
          </p>
          <div className='grid grid-cols-2 gap-6 sm:grid-cols-3 lg:grid-cols-6'>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-6 w-auto text-white'
                viewBox='0 0 124 34'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M17.5 30c8.3 0 15-6.7 15-15s-6.7-15-15-15S2.5 6.7 2.5 15s6.7 15 15 15zm0-28.3c7.3 0 13.3 6 13.3 13.3s-6 13.3-13.3 13.3-13.3-6-13.3-13.3 6-13.3 13.3-13.3z'></path>
                <path d='M15.3 21.9V13h-2.8v-2.4h8.2V13h-2.8v8.9h-2.6zM25.1 21.9v-7.4h-2.3v-2.3h2.3V8.7h2.4v3.5h2.8v2.3h-2.8v7.4h-2.4zM120.3 17.3c0 1.8-1.6 3.3-3.4 3.3-1.8 0-3.4-1.5-3.4-3.3s1.5-3.3 3.4-3.3c1.8-.1 3.4 1.4 3.4 3.3zm-5.8 0c0 1.3 1.1 2.3 2.4 2.3 1.3 0 2.4-1.1 2.4-2.3 0-1.3-1.1-2.4-2.4-2.4-1.3 0-2.4 1.1-2.4 2.4zm60.3 0c0 1.8-1.6 3.3-3.4 3.3s-3.4-1.5-3.4-3.3 1.5-3.3 3.4-3.3c1.9-.1 3.4 1.4 3.4 3.3zm-5.7 0c0 1.3 1.1 2.3 2.4 2.3 1.3 0 2.4-1.1 2.4-2.3 0-1.3-1.1-2.4-2.4-2.4-1.3 0-2.4 1.1-2.4 2.4zm-67.8 2.6h-1.1v-5.8h1.1c1.9 0 2.9 1.3 2.9 2.9 0 1.7-1 2.9-2.9 2.9zm.1-6.7h-2.1v7.7h2c2.4 0 4-1.6 4-3.8 0-2.2-1.6-3.9-3.9-3.9zM50 19.8h4.2v-1H50v-2h4.5v-1h-5.5v7.7h5.6v-1H50v-2.7zm29 1h3.8v-1H79v-5.7h-1v6.7zm-9.8-5.5c-1 0-1.8.3-2.5 1l.5.8c.5-.5 1.1-.7 1.8-.7 1 0 1.5.4 1.5 1.2v.3h-1.8c-1.6 0-2.4.7-2.4 1.8 0 1 .7 1.8 2.1 1.8.8 0 1.6-.3 2-.7v.6h1v-3.7c-.1-1.3-1-2.4-2.2-2.4zm1.3 4c0 .8-.8 1.3-1.7 1.3-.8 0-1.3-.3-1.3-.9 0-.7.5-.9 1.6-.9h1.4v.5zm58.5-1.8h-3.8v-2.7h3.8v-1h-4.8v7.7h1v-3h3.8v-1zm6.7-1.9c-1-.4-1.2-.6-1.2-1.1 0-.5.5-.8 1.1-.8.5 0 .9.1 1.4.5l.5-.9c-.5-.4-1.2-.6-1.9-.6-1.2 0-2.1.8-2.1 1.9 0 1 .6 1.5 1.9 2 1 .4 1.2.7 1.2 1.2 0 .6-.5 1-1.3 1-.7 0-1.3-.3-1.7-.7l-.5.8c.6.6 1.4.9 2.2.9 1.4 0 2.4-.8 2.4-2.1 0-1.1-.6-1.6-2-2.1zm-10.3-.1c1 0 1.6.8 1.6 1.8 0 1.1-.7 1.9-1.6 1.9h-1.9v-3.7h1.9zm-2.9-1h3c1.7 0 2.7 1.2 2.7 2.7 0 1.6-1 2.9-2.7 2.9h-3v-5.6zm-57.5 3h-3.8v-2.7h3.8v-1h-4.8v7.7h1v-3h3.8v-1zm-9.7-3h-1v7.7h1v-7.7zm-15.3 1.2c.8 0 1.3.3 1.8.8l.7-.7c-.6-.6-1.4-1-2.5-1-1.9 0-3.3 1.5-3.3 3.3S41 21 42.9 21c1.1 0 1.9-.4 2.5-1.1l-.7-.7c-.5.5-1 .8-1.8.8-1.3 0-2.3-1.1-2.3-2.4.1-1.3 1-2.3 2.3-2.3z'></path>
                <path d='M109.1 16.5c0 2.1-1.3 3.8-3.4 3.8-2 0-3.4-1.7-3.4-3.8s1.4-3.8 3.4-3.8c2.1 0 3.4 1.7 3.4 3.8zm-7.8 0c0 2.6 1.9 4.7 4.4 4.7s4.4-2.1 4.4-4.7-1.9-4.7-4.4-4.7-4.4 2.1-4.4 4.7z'></path>
              </svg>
            </div>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-5 w-auto text-white'
                viewBox='0 0 150 34'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M93.3 15.5c0-3.1-2.1-4.6-5.5-4.6h-5.2v9.1h5.2c3.4.1 5.5-1.4 5.5-4.5zm-4.4 0c0 1.8-.9 2.7-2.9 2.7h-1V12.8h1c1.9 0 2.9.9 2.9 2.7zm-13.8 12.7l-5.7-8.7c2.3-.8 3.5-2.5 3.5-5.1 0-3.1-2.1-4.6-5.5-4.6h-5.2v18.4h2.5v-8.2h2l5.1 8.2h3.3zm-4.8-13.9c0 1.8-.9 2.7-2.9 2.7h-1V12.8h1c1.9 0 2.9.9 2.9 2.5zm77.2-1.9v-2.4h-9.8v18.2h9.8v-2.4h-7.3v-5.5h6.7v-2.3h-6.7v-5.6h7.3zm-17.4 15.8h2.5V10h-2.5v18.2zm-7.1-16h4.2v16h2.5V12.2h4.2V10h-10.9v2.2zm-4.1 16h2.5V10h-2.5v18.2zm-12.5-11.9c0 3.5 2.2 4.8 4.6 5.5 1.9.5 3.4.9 3.4 2.7 0 1.5-1.3 2-2.9 2-1.8 0-3.5-.7-4.9-1.7l-1.1 2.1c1.6 1.2 3.7 1.9 5.9 1.9 3.2 0 5.5-1.6 5.5-4.8 0-3.8-2.7-4.9-5-5.5-1.9-.5-3-1-3-2.5 0-1.3 1.1-1.9 2.6-1.9 1.5 0 3 .5 4.3 1.4l1.1-2c-1.6-1.1-3.4-1.7-5.4-1.7-2.9 0-5.1 1.4-5.1 4.5zm-14.5 5.1H85v6.8h2.5v-6.8h4.1v-2.3h-4.1V12h4.1V10h-10.6v2h4.1v6.2zm-10.5-1.5h-5.8v-6.5h5.8V10H55.8v18.2h2.5v-7.6h5.8v-2.3zM36.2 28.2h2.5V10h-2.5v18.2zm134.9-15.8h4.2v16h2.5v-16h4.2V10h-10.9v2.4zm-12.7 4.4l3.1-6.4 3.1 6.4h-6.2zm3.1-8.8l-7.5 16h2.6l1.7-3.7h7.5l1.7 3.7h2.7l-7.5-16h-1.2z'></path>
                <path d='M20.4 20.4c0 3-2.4 5.5-5.5 5.5-3 0-5.5-2.4-5.5-5.5V3.9H6.6v16.5c0 4.6 3.7 8.3 8.3 8.3s8.3-3.7 8.3-8.3V3.9h-2.9v16.5zm-20 7.9h2.9v-25H.4v25z'></path>
              </svg>
            </div>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-7 w-auto text-white'
                viewBox='0 0 180 40'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M67.6 27.2h10.5v-5.7h-4.3v-.2c1.5-1.2 2-3.1 2-5.6v-.9h-8.2v12.4zm6.3-5.7v.2h-2.7v-3h3.1c0 1.5-.2 2.4-.4 2.8z'></path>
                <path d='M19.8 0L0 11.7v6.1h.1l.3-.2h4.7L25.3 6.9l-5.5-6.9zM20 28.6L0 40l20.4-6 .3-.1-.7-5.3z'></path>
                <path d='M21.7 0h-1.9L0 40h6.7l15-40zM67.5 12.3h4.3v-1h-4.3zM83.3 12.7c0-2.9-2.3-2.7-2.3-2.7h-9.9v17.1h5.2V23h1.9l2.4 4.1h5.3v-.3l-2.8-4.4c.6-.2 2.4-1 2.4-3.9v-1c-.1-1 .1-3.8-2.2-4.8zm-2.4 5.5h-4.6v-3.4h4.6c1.3 0 1.3 3.4 0 3.4zM90.8 10H86v17.1h4.8zM100 17.4h-3v3.3h3.2c1.3 0 1.3-3.3-.2-3.3zM100.4 10h-9.9v17.1h9.4c3.6 0 4.8-1.8 4.9-4.2v-8.8c0-2.4-1.3-4.1-4.4-4.1zm-.4 12.7h-4.6v-7.9H100c.8 0 1.3.4 1.3 1V21c0 1.2-.5 1.7-1.3 1.7zM111.7 10h-4.9v17.1h4.9zM118.4 23.2h-1.9v-8.5h1.8c3.8 0 3.8 8.5.1 8.5zM118.6 10h-6.8v17.1h5.5v.1c1.9 0 6.2-1.5 6.1-8.5.1-5.7-2.9-8.7-4.8-8.7zM131.7 10.5c-1.1-.6-3.6-.9-5.4.5-2.4 1.9-2.1 4.5-2.1 4.5h4.7v-1.2c0-.3.3-.7.9-.7.6 0 .9.2.9.8 0 .5-.1.7-2.1 2.4-2.3 1.9-2.4 3.2-2.5 5v1.4h10.4v-3.9h-5.5c0-.5 2.4-2.3 3.7-3.5 1.2-1.1 1.5-2 1.5-3.1.1-1.3-.6-2.7-4.5-2.2zM143.2 16.7h-4.1v-3.5h4c1.3 0 1.6 3.5.1 3.5zM143.4 10h-9v17.1h4.7v-6.5h4.3c3.3 0 4.5-2.3 4.5-5 0-2.8-1.3-5.6-4.5-5.6zM157.2 22.7c-1.4 0-2-1.1-2-2.6V10h-4.8v12.1c0 3.1 2.2 5.3 5.1 5.3h3c2.9 0 5.1-2.2 5.1-5.3V10h-4.7v10.1c0 1.5-.5 2.6-1.9 2.6h.2zM179.9 10l-3.2 7.6L173.6 10h-5.2v.1l6.4 14s.1.2.2.4v2.5h4.8v-2.4c.1-.3.3-.6.3-.6L187 10h-7.1z'></path>
              </svg>
            </div>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-6 w-auto text-white'
                viewBox='0 0 124 24'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M23.5 24H.5c-.3 0-.5-.2-.5-.5s.2-.5.5-.5h23c.3 0 .5.2.5.5s-.2.5-.5.5zm-9.8-21.9c.3 0 .5.2.5.5v2c0 .3-.2.5-.5.5s-.5-.2-.5-.5v-2c0-.3.2-.5.5-.5zm0 19.4c-.3 0-.5-.2-.5-.5v-13c0-.3.2-.5.5-.5s.5.2.5.5v13c0 .3-.2.5-.5.5zm-8.1-17.4c0-.3.2-.5.5-.5h3.8c.3 0 .5.2.5.5s-.2.5-.5.5H6.1c-.3 0-.5-.2-.5-.5zm12.8 0c0-.3.2-.5.5-.5h3.8c.3 0 .5.2.5.5s-.2.5-.5.5h-3.8c-.3 0-.5-.2-.5-.5zm30.1 8.5c0 5.4-4.4 9.8-9.8 9.8-5.4 0-9.8-4.4-9.8-9.8 0-5.4 4.4-9.8 9.8-9.8 5.4 0 9.8 4.4 9.8 9.8zm-1.5 0c0-4.6-3.7-8.3-8.3-8.3s-8.3 3.7-8.3 8.3 3.7 8.3 8.3 8.3 8.3-3.7 8.3-8.3zM63.3 23h-1.5V10.7c0-.9-.7-1.6-1.6-1.6-.9 0-1.6.7-1.6 1.6v10.4c0 1-.8 1.8-1.8 1.8s-1.8-.8-1.8-1.8V12.1c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6v9.1c0 1-.8 1.8-1.8 1.8H48V10.7c0-2.8 2.3-5.1 5.1-5.1 1.3 0 2.5.5 3.4 1.3.9-.8 2.1-1.3 3.4-1.3 2.8 0 5.1 2.3 5.1 5.1V23h-1.7zM80 23h-1.5V9.2c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6v9.6c0 2.3-1.9 4.2-4.2 4.2h-1.7V12.1c0-2.8 2.3-5.1 5.1-5.1 1.3 0 2.6.5 3.5 1.4.5-.9 1.4-1.4 2.5-1.4h1.1V23H80zm28.7 0h-1.5V9.1c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6V23h-1.5V12.1c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6V23h-1.5V12.1c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6v9.1c0 1-.8 1.8-1.8 1.8h-1.7V10.7c0-2.8 2.3-5.1 5.1-5.1 1.3 0 2.5.5 3.4 1.3.9-.8 2.1-1.3 3.4-1.3s2.5.5 3.4 1.3c.9-.8 2.1-1.3 3.4-1.3 2.8 0 5.1 2.3 5.1 5.1v10.4h-1.5V10.7c0-.9-.7-1.6-1.6-1.6s-1.6.7-1.6 1.6V23zm15.1 0h-1.5V10.7c0-2.8 2.3-5.1 5.1-5.1h1.7v17.4h-1.5V7.1h-.2c-2 0-3.6 1.6-3.6 3.6V23z'></path>
              </svg>
            </div>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-5 w-auto text-white'
                viewBox='0 0 124 24'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M49.4 14.3c-.2-.6-.9-3.2-2.9-3.2-1.3 0-1.9 1.1-1.9 1.8 0 .8.6 1.8 1.9 1.8 1.8 0 2.6-2.3 2.9-3.2v.1c.1-.3 0-.3 0-.3zm7.3 4.6c-1.5 0-2.2-1.2-2.4-1.8.2-.4 1.5-3.1 3.9-3.1.8 0 1.8.4 1.8 1.3 0 1.3-1.7 3.6-3.3 3.6zM27.7 10h-1.3v2h1.3c.7 0 1.1-.5 1.1-1s-.4-1-1.1-1zm50.7 7.5c-.4 0-.8-.1-1.2-.2-.2-.1-.6-.2-.8-.4-.1-.1-.1-.2-.1-.3 0-.2.3-.4.5-.4l.3.1.6.2c.2.1.4.1.6.1.8 0 1.1-.5 1.1-.9 0-.3-.2-.6-.9-.9l-.8-.3C77 14.1 76 13.4 76 12c0-1.2 1-2.2 2.5-2.2.4 0 .8.1 1.1.2.2.1.5.2.6.3.1.1.2.2.2.3 0 .2-.3.4-.5.4s-.3-.1-.5-.2c-.2-.1-.5-.2-.9-.2-.7 0-1.1.4-1.1.9 0 .3.2.6.9.9l.8.3c.8.3 1.7 1 1.7 2.3.1 1.3-1 2.5-2.4 2.5zm-9.8 0c-1.3 0-2.6-.8-2.6-2.2 0-.2.1-.3.5-.3s.5.1.5.3c0 .8.7 1.3 1.6 1.3.8 0 1.4-.5 1.4-1.2 0-.9-.6-1.3-1.4-1.3h-.3c-.2 0-.4-.1-.4-.3 0-.3.2-.4.4-.4h.3c.7 0 1.2-.4 1.2-1.1 0-.6-.5-1-1.2-1-.7 0-1.3.4-1.3 1 0 .2-.1.3-.5.3s-.5-.1-.5-.3c0-1.2 1.1-2 2.3-2 1.2 0 2.2.8 2.2 1.9 0 .8-.5 1.4-1 1.6.6.2 1.2.9 1.2 1.8.1 1.3-1 2.2-2.4 2.2zm-5.4 0c-1.9 0-3.7-1.5-3.7-3.4s1.8-3.4 3.7-3.4 3.7 1.5 3.7 3.4-1.7 3.4-3.7 3.4zm0-1c1.3 0 2.7-1 2.7-2.5 0-1.4-1.3-2.5-2.7-2.5s-2.7 1-2.7 2.5c0 1.4 1.4 2.5 2.7 2.5zm-6.8 1c-1.9 0-3.7-1.5-3.7-3.4s1.8-3.4 3.7-3.4c1.9 0 3.7 1.5 3.7 3.4s-1.7 3.4-3.7 3.4zm0-1c1.3 0 2.7-1 2.7-2.5 0-1.4-1.3-2.5-2.7-2.5s-2.7 1-2.7 2.5c0 1.4 1.4 2.5 2.7 2.5zm-6.8 1c-1.9 0-3.7-1.5-3.7-3.4s1.8-3.4 3.7-3.4c1.9 0 3.7 1.5 3.7 3.4s-1.7 3.4-3.7 3.4zm0-1c1.3 0 2.7-1 2.7-2.5 0-1.4-1.3-2.5-2.7-2.5s-2.7 1-2.7 2.5c0 1.4 1.4 2.5 2.7 2.5zm-16.8.7c-1 0-2-.3-2.8-.9 0 0-.2-.1-.2-.3s.3-.5.5-.5c.1 0 .2 0 .3.1.6.5 1.4.7 2.1.7 1.4 0 2.4-1 2.4-2.1s-1-2.1-2.4-2.1c-.6 0-1.2.2-1.6.5-.2.1-.3.2-.4.2-.3 0-.5-.2-.5-.5 0-.1.1-.2.2-.3.6-.4 1.4-.7 2.3-.7 1.9 0 3.4 1.3 3.4 3 .1 1.6-1.4 2.9-3.3 2.9zm-6.5 0c-1.3 0-2.6-.8-2.6-2.2 0-.2.1-.3.5-.3s.5.1.5.3c0 .8.7 1.3 1.6 1.3.8 0 1.4-.5 1.4-1.2 0-.9-.6-1.3-1.4-1.3h-.3c-.2 0-.4-.1-.4-.3 0-.3.2-.4.4-.4h.3c.7 0 1.2-.4 1.2-1.1 0-.6-.5-1-1.2-1-.7 0-1.3.4-1.3 1 0 .2-.1.3-.5.3s-.5-.1-.5-.3c0-1.2 1.1-2 2.3-2 1.2 0 2.2.8 2.2 1.9 0 .8-.5 1.4-1 1.6.6.2 1.2.9 1.2 1.8.1 1.3-1 2.2-2.4 2.2zm-6 0c-.4 0-.8-.1-1.2-.2-.2-.1-.6-.2-.8-.4-.1-.1-.1-.2-.1-.3 0-.2.3-.4.5-.4l.3.1.6.2c.2.1.4.1.6.1.8 0 1.1-.5 1.1-.9 0-.3-.2-.6-.9-.9l-.8-.3c-.8-.3-1.7-1-1.7-2.2 0-1.2 1-2.2 2.5-2.2.4 0 .8.1 1.1.2.2.1.5.2.6.3.1.1.2.2.2.3 0 .2-.3.4-.5.4s-.3-.1-.5-.2c-.2-.1-.5-.2-.9-.2-.7 0-1.1.4-1.1.9 0 .3.2.6.9.9l.8.3c.8.3 1.7 1 1.7 2.3 0 1.3-1.1 2.5-2.4 2.5zm-6-5.7c.5.4.8 1 .8 1.7 0 1.2-1 2.3-2.5 2.3-.4 0-.9-.1-1.2-.3-.3.4-.6 1-.6 1.3 0 .3.2.5.6.5.2 0 .3.1.3.4s-.2.3-.4.3c-.8 0-1.3-.5-1.3-1.2 0-.5.3-1.3.8-2-.4-.4-.7-1-.7-1.6 0-1.2 1-2.3 2.5-2.3s2.5 1 2.7 1.9zm-3.1-.6c-.8 0-1.5.6-1.5 1.4 0 .8.7 1.4 1.5 1.4s1.5-.6 1.5-1.4c0-.8-.7-1.4-1.5-1.4zM8.1 18c-.2 0-.3-.1-.4-.3l-1.1-2.4H3.5l-1.1 2.4c-.1.2-.2.3-.4.3s-.5-.1-.5-.4c0-.1 0-.1.1-.2l3.1-6.6c.1-.2.3-.3.4-.3s.3.1.4.3l3.1 6.6v.2c.1.3-.1.4-.5.4zm-2-3.6l-1.2-2.5-1.2 2.5h2.4zm15.4 3.6c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h2.3c1.9 0 3.4 1.3 3.4 2.9s-1.4 2.9-3.4 2.9h-1.5v1.1c0 .2-.1.3-.3.3h-.5zm2.4-2.3c1.3 0 2.4-.9 2.4-2 0-1.1-1.1-2-2.4-2h-1.5v4h1.5zm19.9 2.3c-.2 0-.4-.2-.4-.4v-6.4c0-.2.2-.4.4-.4h.6c.2 0 .4.2.4.4v2.6h4.5v-2.6c0-.2.2-.4.4-.4h.6c.2 0 .4.2.4.4v6.4c0 .2-.2.4-.4.4h-.6c-.2 0-.4-.2-.4-.4v-2.8h-4.5v2.8c0 .2-.2.4-.4.4h-.6zm15.2 0c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h.5c.2 0 .3.1.3.3v6.6c0 .2-.1.3-.3.3h-.5zm2.8 0c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h.5c.2 0 .3.1.4.3l3.1 5.1v-5.1c0-.2.1-.3.3-.3h.5c.2 0 .3.1.3.3v6.6c0 .2-.1.3-.3.3h-.5c-.2 0-.3-.1-.4-.3l-3.1-5.2v5.2c0 .2-.1.3-.3.3h-.5zm6.2-6.2c-.2 0-.4-.2-.4-.4v-.6c0-.2.2-.4.4-.4h5.3c.2 0 .4.2.4.4v.6c0 .2-.2.4-.4.4h-2.1v5.9c0 .2-.2.4-.4.4h-.6c-.2 0-.4-.2-.4-.4v-5.9h-1.8zm93.2 6.2c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h4.8c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-4v2h3.5c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-3.5v2.1h4c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-4.8zm-5.8 0c-.2 0-.3-.1-.3-.3v-5.8h-2c-.2 0-.3-.1-.3-.3v-.5c0-.2.1-.3.3-.3h5.1c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-2v5.8c0 .2-.1.3-.3.3h-.5zm-4.2 0c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h.5c.2 0 .3.1.3.3v6.6c0 .2-.1.3-.3.3h-.5zm-4.1 0c-.2 0-.3-.1-.4-.3l-1.1-2.4h-3.1l-1.1 2.4c-.1.2-.2.3-.4.3s-.5-.1-.5-.4c0-.1 0-.1.1-.2l3.1-6.6c.1-.2.3-.3.4-.3s.3.1.4.3l3.1 6.6v.2c.1.3-.1.4-.5.4zm-2-3.6l-1.2-2.5-1.2 2.5h2.4zm-6.8 3.6c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h2.3c1.9 0 3.4 1.3 3.4 2.9s-1.4 2.9-3.4 2.9h-1.5v1.1c0 .2-.1.3-.3.3h-.5zm2.4-2.3c1.3 0 2.4-.9 2.4-2 0-1.1-1.1-2-2.4-2h-1.5v4h1.5zM109 18c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h.5c.2 0 .3.1.3.3v6.6c0 .2-.1.3-.3.3h-.5zm6.4 0c-.2 0-.3-.1-.3-.3v-6.6c0-.2.1-.3.3-.3h4.8c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-4v2h3.5c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-3.5v2.1h4c.2 0 .3.1.3.3v.5c0 .2-.1.3-.3.3h-4.8z'></path>
              </svg>
            </div>
            <div className='flex h-12 items-center justify-center opacity-70 grayscale transition-all duration-300 hover:opacity-100 hover:grayscale-0'>
              <svg
                className='h-5 w-auto text-white'
                viewBox='0 0 120 24'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.4 5.9a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm7.4 3.5a7.4 7.4 0 1 1-14.8 0 7.4 7.4 0 0 1 14.8 0zm9.4-1.5a3.5 3.5 0 1 0 3.4 3.5 3.5 3.5 0 0 0-3.4-3.5zm3.9 7a3.9 3.9 0 0 1-7.8 0v-7a3.9 3.9 0 0 1 7.8 0zM47 5.9a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm0-3.9a7.4 7.4 0 0 1 5.8 12 7.5 7.5 0 0 1-5.8 2.8 7.4 7.4 0 0 1-5.8-12A7.5 7.5 0 0 1 47 2zm17.1 3.9a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm0-3.9a7.4 7.4 0 0 1 5.8 12 7.5 7.5 0 0 1-5.8 2.8 7.4 7.4 0 0 1-5.8-12A7.5 7.5 0 0 1 64.1 2zm14.6 1.7h.2a3.7 3.7 0 0 1 3.3 2 7.5 7.5 0 0 1-3.3 10.1 7.3 7.3 0 0 1-3.5.8 7.4 7.4 0 0 1-5.8-12 7.5 7.5 0 0 1 9.1-1zm1.7 2a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm28.3 5.2a3.9 3.9 0 0 1-7.8 0v-7a3.9 3.9 0 0 1 7.8 0zm-3.9-8.5A7.5 7.5 0 0 0 99 5.6a7.4 7.4 0 0 0-2.3 5.5v2.7a7.5 7.5 0 0 0 2.3 5.6 7.5 7.5 0 0 0 13.5-4.3V11a7.4 7.4 0 0 0-7.7-8.5zm-25.9 9.4V3a1 1 0 0 0-1-1 7.5 7.5 0 0 0-5.9 2.9A7.4 7.4 0 0 0 88.9 19a7.5 7.5 0 0 0 5.9-2.9 7.4 7.4 0 0 0 1.5-4.5 1 1 0 0 0-1-1h-7.2a1 1 0 0 0-1 1v2.8a1 1 0 0 0 1 1H93a3.5 3.5 0 1 1 0-7h0z'></path>
              </svg>
            </div>
          </div>
        </div>
      </div>

      <div className='absolute bottom-0 left-0 right-0'>
        <svg
          xmlns='http://www.w3.org/2000/svg'
          viewBox='0 0 1440 100'
          className='fill-white dark:fill-neutral-900'
        >
          <path d='M0,0 C240,95 480,95 720,45 C960,-5 1200,-5 1440,45 L1440,100 L0,100 Z'></path>
        </svg>
      </div>
    </section>
  )
}

export default HeroSection
